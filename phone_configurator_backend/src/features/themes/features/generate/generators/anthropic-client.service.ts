import { Injectable, Logger } from '@nestjs/common';
import Anthropic from '@anthropic-ai/sdk';

export interface ToolSpec {
  name: string;
  description: string;
  input_schema: Record<string, any>;
}

/**
 * Thin Anthropic wrapper. Replaces the previous OpenAI client.
 *
 * Uses forced tool use (`tool_choice`) to get a single, schema-shaped object
 * back, with prompt caching on the large static system prompt. Default model
 * is the latest Claude (`claude-opus-4-8`), overridable via ANTHROPIC_MODEL.
 */
@Injectable()
export class AnthropicClientService {
  private readonly logger = new Logger(AnthropicClientService.name);
  readonly client?: Anthropic;
  private readonly model = process.env.ANTHROPIC_MODEL ?? 'claude-opus-4-8';

  constructor() {
    const apiKey = process.env.ANTHROPIC_API_KEY;
    if (apiKey) {
      this.client = new Anthropic({ apiKey });
    } else {
      this.logger.warn('ANTHROPIC_API_KEY not set – deterministic fallbacks will be used');
    }
  }

  get isAvailable(): boolean {
    return !!this.client;
  }

  /**
   * Run a single forced-tool extraction and return the tool input object,
   * or null on any failure (callers fall back to deterministic defaults).
   */
  async extract(
    systemPrompt: string,
    userPrompt: string,
    tool: ToolSpec,
  ): Promise<Record<string, any> | null> {
    if (!this.client) return null;
    try {
      const message = await this.client.messages.create(
        {
          model: this.model,
          max_tokens: 4096,
          // Static system prompt is cached across requests (prefix match).
          system: [{ type: 'text', text: systemPrompt, cache_control: { type: 'ephemeral' } }],
          tools: [tool as Anthropic.Tool],
          tool_choice: { type: 'tool', name: tool.name },
          messages: [{ role: 'user', content: userPrompt }],
        },
        { timeout: 60_000 },
      );

      const block = message.content.find((b) => b.type === 'tool_use');
      if (block && block.type === 'tool_use') {
        return block.input as Record<string, any>;
      }
      this.logger.warn('Anthropic response contained no tool_use block');
      return null;
    } catch (err) {
      if (err instanceof Anthropic.APIError) {
        this.logger.error(`Anthropic API error ${err.status}: ${err.message}`);
      } else {
        this.logger.error('Anthropic call failed', err as any);
      }
      return null;
    }
  }
}

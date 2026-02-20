import { Injectable, Logger } from '@nestjs/common';
import OpenAI from 'openai';

@Injectable()
export class OpenAiClientService {
    private readonly logger = new Logger(OpenAiClientService.name);
    readonly client?: OpenAI;

    constructor() {
        const key = process.env.OPENAI_API_KEY;
        if (key) {
            this.client = new OpenAI({ apiKey: key });
        } else {
            this.logger.warn('OPENAI_API_KEY not set – fallbacks will be used');
        }
    }

    get isAvailable(): boolean {
        return !!this.client;
    }

    async chatJson(
        messages: OpenAI.Chat.ChatCompletionMessageParam[],
        options?: { model?: string; temperature?: number },
    ): Promise<Record<string, any> | null> {
        if (!this.client) return null;
        try {
            const completion = await this.client.chat.completions.create({
                model: options?.model ?? 'gpt-4o-mini',
                temperature: options?.temperature ?? 0.2,
                messages,
                response_format: { type: 'json_object' },
            });
            const content = completion.choices[0]?.message?.content ?? '{}';
            return JSON.parse(content);
        } catch (err) {
            this.logger.error('OpenAI call failed', err);
            return null;
        }
    }
}

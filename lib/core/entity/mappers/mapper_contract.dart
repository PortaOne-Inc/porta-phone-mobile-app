abstract class Mapper<D, M> {
  M mapToModel(D dto);

  D mapToDto(M model);

  D? mapToDtoOrNull(M? model) => model == null ? null : mapToDto(model);

  M? mapToModelOrNull(D? dto) => dto == null ? null : mapToModel(dto);

  List<M> mapToModels(List<D> dto) => dto.map((e) => mapToModel(e)).toList();

  List<D> mapToDTOs(List<M> dto) => dto.map((e) => mapToDto(e)).toList();
}

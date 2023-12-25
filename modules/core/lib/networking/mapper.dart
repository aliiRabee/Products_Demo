abstract class Mapper<T, Y> {
  List<Y> fromModelListToEntityList(List<T>? modelList);

  Y fromModelToEntity(T model);
}

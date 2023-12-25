class MetaModel {
  int? page;
  int? pageSize;
  int? count;
  int? total;
  int? totalPages;

  MetaModel(
      {this.page, this.pageSize, this.count, this.total, this.totalPages});

  MetaModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['pageSize'];
    count = json['count'];
    total = json['total'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['count'] = count;
    data['total'] = total;
    data['totalPages'] = totalPages;
    return data;
  }
}

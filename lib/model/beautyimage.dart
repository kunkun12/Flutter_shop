class BeautyImageModal{
  int width;
  int height;
  String thumb;
  BeautyImageModal({this.height,this.width,this.thumb});
  BeautyImageModal.fromJSON(dynamic json):width= int.parse(json['width']),height=int.parse(json['height']),thumb=json['thumb'];
}
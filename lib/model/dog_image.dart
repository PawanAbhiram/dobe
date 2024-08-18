class DogImage {
    String? message;
    String? status;

    DogImage({
        this.message,
        this.status,
    });

    factory DogImage.fromJson(Map<String, dynamic> json) => DogImage(
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
    };
}
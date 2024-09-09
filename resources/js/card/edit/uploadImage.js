var file;

// 이미지 업로드 기능
function loadFile(input) {
    file = input.files[0];
    // 파일 이름 표시
    $('.edit-file-label').text(file.name);
    var newImage = document.createElement("img");
    newImage.setAttribute("class", "uploadedImage");
    newImage.src = URL.createObjectURL(file);
    // conponent 추가
    $('.uploadedImage').replaceWith(newImage);
}
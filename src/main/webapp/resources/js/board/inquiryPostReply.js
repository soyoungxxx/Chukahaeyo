

$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({

		// 에디터 크기 설정
		width: 760,
		height: 300,
		minHeight: null,             // 최소 높이
		maxHeight: null,
		// 에디터 한글 설정
		lang: 'ko-KR',

		// focus는 작성 페이지 접속시 에디터에 커서를 위치하도록 하려면 설정해주세요.
		focus : true,
		// callbacks은 이미지 업로드 처리입니다.
		callbacks : {
			onImageUpload : function(files, editor, welEditable) {
				// 다중 이미지 처리를 위해 for문을 사용했습니다.
				for (var i = 0; i < files.length; i++) {
					imageUploader(files[i], this);
				}
			},

			onMediaDelete: function($target,editor,$editable){

				let deletedImageUrl = $target.attr('src').split('/').pop();

				deleteSummernoteImageFile(deletedImageUrl);

			}

		}

	});



	$(".inquiry-list-button").click(function(e){
		let contents = $('#summernote').summernote('code');
		contents = contents.trim();
		let id = $(".inquiry-id").val();

		if($('#summernote').summernote('isEmpty')){
			alert("내용을 입력해 주세요");
			return;
		}

		if(contents == ""){
			alert("내용을 입력해 주세요");
			return;
		}





		const form = document.createElement('form'); // form 태그 생성
		form.setAttribute('method', 'post'); // 전송 방식 결정 (get or post)
		form.setAttribute('action', "/admin/board/inquiry/write"); // 전송할 url 지정


		// 여러 개의 데이터를 보낼 경우 위와 같은 코드 반복
		const data_1 = document.createElement('input');
		data_1.setAttribute('type', 'hidden');
		data_1.setAttribute('name', 'inquiryID');
		data_1.setAttribute('value', id);




		// 여러 개의 데이터를 보낼 경우 위와 같은 코드 반복
		const data_2 = document.createElement('input');
		data_2.setAttribute('type', 'hidden');
		data_2.setAttribute('name', 'inquiryAnswer');
		data_2.setAttribute('value', contents);

		// form 태그에 input 태그 넣고 summit 가능하게 처리
		form.appendChild(data_1);
		form.appendChild(data_2);

		document.body.appendChild(form);

		form.submit();

	});



});


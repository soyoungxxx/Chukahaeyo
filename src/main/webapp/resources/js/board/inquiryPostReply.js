

$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
          width: 760,
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
          
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


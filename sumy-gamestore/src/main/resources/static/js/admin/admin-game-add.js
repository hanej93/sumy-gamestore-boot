let gameAdd = {
    init: function () {
        $("#btn-game-add").on("click", () => {
            this.add();
        });

        $("#btn-game-add-parent").on("click", () => {
            this.valid();
            $('#exampleModal').modal('show');
        });

        $("#btn-game-update").on("click", () => {
            this.update();
        });

        // 할인된 가격 스크립트 시작
        $("#sumy-game-input-price").on("blur", () => {
            this.inputPriceReg();
        });

        $("#sumy-game-discount-rate").on("blur", () => {
            this.outputPriceReg();
        });
        this.inputPriceReg();
        this.outputPriceReg();
        // 할인된 가격 스크립트 끝

        $("#sumy-game-category input[type='checkbox']").on("click", () => {
            this.checkboxLimit();
        });
    },

    add: function () {
        let stringNum = $("#sumy-game-input-price").val();
        let regex = /[^0-9]/g;
        let numberToString = stringNum.replace(regex, "");

        let categoryList = {
            gameCategoryId1: null,
            gameCategoryId2: null,
            gameCategoryId3: null,
            gameCategoryId4: null
        };
        $("#sumy-game-category input[type='checkbox']:checked").each(function (index) {
            let categoryStr = "gameCategoryId" + (index + 1);
            categoryList[categoryStr] = $(this).val();
        });

        let data = {
            gameTitle: $("#gameTitle").val(),
            gameDev: $("#gameDev").val(),
            gameRate: $("#gameRate").val(),
            gamePrice: numberToString,
            gameSubText: $("#gameSubText").val(),
            gameMainText: $("#summernote").summernote('code'),
            gameDiscountRate: $("#sumy-game-discount-rate").val(),
            gameCategoryId1: categoryList.gameCategoryId1,
            gameCategoryId2: categoryList.gameCategoryId2,
            gameCategoryId3: categoryList.gameCategoryId3,
            gameCategoryId4: categoryList.gameCategoryId4
        };

        let form = $('#fileForm')[0];
        let formData = new FormData(form);

        let len = $('#input-multiple-image')[0].files.length;

        for (let i = 0; i < len; i++) {
            formData.append("files", $('#input-multiple-image')[0].files[i]);
        }

        formData.append('gameInfo', new Blob([JSON.stringify(data)], {type: "application/json"}));
        formData.append('file', $('#fileAttachment')[0].files[0]);

        $.ajax({
            type: 'POST',
            url: '/admin/game/add',
            enctype: "multipart/form-data",
            processData: false,
            contentType: false,
            data: formData,
        }).done(function () {
            $("#exampleModal2").modal('show');
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });
    },

    valid: function () {
        if ($("#gameTitle").val() == "") {
            alert("게임제목을 입력해주세요!");
            $("#gameTitle").focus();
            return false;
        }

        if ($("#gameDev").val() == "") {
            alert("게임제작사명을 입력해주세요!");
            $("#gameDev").focus();
            return false;
        }

        if ($("#gameRate").val() == "") {
            alert("게임등급을 입력해주세요!");
            $("#gameRate").focus();
            return false;
        }

        if ($("#fileAttachment").val() == "") {
            alert("이미지를 첨부해주세요!");
            $("#fileAttachment").focus();
            return false;
        }

        if ($("#sumy-game-input-price").val() == "") {
            alert("게임가격을 입력해주세요!");
            $("#sumy-game-input-price").focus();
            return false;
        }

        if ($("#sumy-game-category input[type='checkbox']:checked").length < 1) {
            alert("카테고리를 최소 1개입력해주세요!");
            return false;
        }

        if ($("#gameSubText").val() == "") {
            alert("게임설명을 입력해주세요!");
            $("#gameSubText").focus();
            return false;
        }

        if ($("#summernote").val() == "") {
            alert("게임본문을 입력해주세요!");
            $("#summernote").focus();
            return false;
        }

        if ($("#input-multiple-image").val() == "") {
            alert("이미지를 첨부해주세요!");
            $("#input-multiple-image").focus();
            return false;
        }

        $('#exampleModal').modal('show');


    },

    update: function () {
        let stringNum = $("#sumy-game-input-price").val();
        let regex = /[^0-9]/g;
        let numberToString = stringNum.replace(regex, "");

        let categoryList = {
            gameCategoryId1: null,
            gameCategoryId2: null,
            gameCategoryId3: null,
            gameCategoryId4: null
        };
        $("#sumy-game-category input[type='checkbox']:checked").each(function (index) {
            let categoryStr = "gameCategoryId" + (index + 1);
            categoryList[categoryStr] = $(this).val();
        });

        console.log("코드" + $("#summernote").summernote('code'));
        console.log("밸류" + $("#summernote").val());

        let data = {
            gameId: $("#gameId").val(),
            gameTitle: $("#gameTitle").val(),
            gameDev: $("#gameDev").val(),
            gameRate: $("#gameRate").val(),
            gamePrice: numberToString,
            gameSubText: $("#gameSubText").val(),
            gameMainText: $("#summernote").summernote('code'),
            gameDiscountRate: $("#sumy-game-discount-rate").val(),
            gameCategoryId1: categoryList.gameCategoryId1,
            gameCategoryId2: categoryList.gameCategoryId2,
            gameCategoryId3: categoryList.gameCategoryId3,
            gameCategoryId4: categoryList.gameCategoryId4

        };

        let form = $('#fileForm')[0];
        let formData = new FormData(form);

        let len = $('#input-multiple-image')[0].files.length;

        for (let i = 0; i < len; i++) {
            formData.append("files", $('#input-multiple-image')[0].files[i]);
        }

        formData.append('gameInfo', new Blob([JSON.stringify(data)], {type: "application/json"}));
        formData.append('file', $('#fileAttachment')[0].files[0]);

        $.ajax({
            type: 'PUT',
            url: '/admin/game/update',
            enctype: "multipart/form-data",
            processData: false,
            contentType: false,
            data: formData,
        }).done(function () {
            $("#exampleModal2").modal('show');
        }).fail(function (error) {
            alert(JSON.stringify(error));
        });

    },

    inputPriceReg: function () {
        const inputPrice = $("#sumy-game-input-price").val();
        const inputPriceNonComma = inputPrice.split(',').join('');

        const discountRate = $("#sumy-game-discount-rate").val();
        const resultPriceObject = $("#sumy-game-result-price");
        const resultPriceVal = Math.round(inputPriceNonComma * (100 - discountRate) / 100);
        const currencyInput = inputPriceNonComma.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        const currencyResult = resultPriceVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        $("#sumy-game-input-price").val(currencyInput);
        resultPriceObject.val(currencyResult);
    },

    outputPriceReg: function () {
        const inputPrice = $("#sumy-game-input-price").val();
        const inputPriceNonComma = inputPrice.split(',').join('');

        let discountRate = Math.floor($("#sumy-game-discount-rate").val());
        $("#sumy-game-discount-rate").val(discountRate);
        if (discountRate > 100) {
            $("#sumy-game-discount-rate").val(100);
            discountRate = 100;
        }

        const resultPriceObject = $("#sumy-game-result-price");
        const resultPriceVal = Math.round(inputPriceNonComma * (100 - discountRate) / 100);
        const currencyInput = inputPriceNonComma.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        const currencyResult = resultPriceVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        $("#sumy-game-input-price").val(currencyInput);
        resultPriceObject.val(currencyResult);
    },

    checkboxLimit: function () {
        let count = $("#sumy-game-category input[type='checkbox']:checked").length;
        if (count > 4) {
            $(this).prop("checked", false);
            alert("카테고리는 4개까지 선택 가능 합니다.");
        }
    }
}

gameAdd.init();



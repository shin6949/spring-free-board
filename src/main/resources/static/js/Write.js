let oEditors = []

smartEditor = function() {
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "editorTxt",
        sSkinURI: "/static/smarteditor/SmartEditor2Skin.html",
        fCreator: "createSEditor2"
    })
}

$(document).ready(function() {
    smartEditor()
})

const submitPost = (inputElement) => {
    oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
    let content = document.getElementById("editorTxt").value;

    if(content === '<p>&nbsp;</p>') {
        alert("내용을 입력해주세요.");
        oEditors.getById["editorTxt"].exec("FOCUS");
        return false;
    }

    return true;
}

const addExamplePhoto = () => {
    console.log("CALLED");
    console.log("window: " + window);
    console.log("window.nhn: " + window.nhn);
    console.log("window.nhn.husky: " + window.nhn.husky);
    // console.log("window.nhn.husky.PopUpManager: " + window.nhn.husky.PopUpManager);

    const aFileInfo = [
        {
            sFileName : "cocoblue.jpg",
            sFileURL :"https://overlay.cocoblue.me/images/cocoblue.jpg",
            bNewLine : true
        }
    ]

    //스마트 에디터 플러그인을 통해서 넣는 방법 (oFileInfo는 Array)
    window.nhn.husky.setCallback(window, 'SET_PHOTO', [aFileInfo]);
    //본문에 바로 tag를 넣는 방법 (oFileInfo는 String으로 <img src=....> )
    //opener.nhn.husky.PopUpManager.setCallback(window, 'PASTE_HTML', [oFileInfo]);
}
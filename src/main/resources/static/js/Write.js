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

submitPost = function() {
    oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
    let content = document.getElementById("editorTxt").value;
    console.log(content);

    if(content === '<p>&nbsp;</p>') {
        alert("내용을 입력해주세요.");
        oEditors.getById["editorTxt"].exec("FOCUS");
        return
    } else {
        console.log(content)
    }
}
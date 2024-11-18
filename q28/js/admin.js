function deletePage(pageid, pagename) {
    if (confirm(`Delete the page '${pagename}'?`)) {
        $.ajax({
            type: "POST",
            url: "components/deletePage.cfc?method=deletePage",
            dataType: "json",
            data: {pageid: pageid},
            success: function() {
                location.reload();
            }
        });
    }
}

function OverlayToggle() {
    const overlayForm = document.getElementById("overlayForm");
    const addPageBtn = document.getElementById("addPageBtn");
    const addPageFormError = document.getElementById("addPageFormError");

    addPageFormError.textContent = "";
    if (overlayForm.style.display == "block") {
        overlayForm.style.display = "none";
        addPageBtn.style.backgroundColor = "white";
        addPageBtn.innerHTML = "<i class='fa-solid fa-plus'>";
    }
    else {
        overlayForm.style.display = "block";
        addPageBtn.style.backgroundColor = "red";
        addPageBtn.innerHTML = "<i class='fa-solid fa-xmark'></i>";
    }
}

document.getElementById("addPageForm").addEventListener('submit', function (event) {
    const pageName = document.getElementById("pageNameInput").value;
    const pageDesc = document.getElementById("pageDescInput").value;
    const pageId = document.getElementById("pageIdInput").value;
    const addPageFormError = document.getElementById("addPageFormError");
    let ajaxData = {pageName: pageName, pageDesc: pageDesc};
    let ajaxUrl = "";
    if (pageId != "") {
        ajaxData.pageId = parseInt(pageId);
        ajaxUrl = "components/modifyPage.cfc?method=editPage";
    }
    else {
        ajaxUrl = "components/modifyPage.cfc?method=addPage";
    }

    event.preventDefault();
    $.ajax({
        type: "POST",
        url: ajaxUrl,
        dataType: "json",
        data: ajaxData,
        success: function(response){
		if (response) {
			addPageFormError.textContent = "";
			location.reload();
		}
		else {
			addPageFormError.textContent = "Page with same name exists";
		}
        }
    });
});

function addPage() {
    document.getElementById("pageIdInput").value = "";
    document.getElementById("pageNameInput").value = "";
    document.getElementById("pageDescInput").value = "";
    OverlayToggle();
}

function editPage(pageid, pagename, pagedescs) {
    document.getElementById("pageIdInput").value = pageid;
    document.getElementById("pageNameInput").value = pagename;
    document.getElementById("pageDescInput").value = pagedescs;
    OverlayToggle();
}

function logOut() {
    if(confirm("Do you want to logout?")) {
        $.ajax({
            type: "POST",
            url: "./components/logOut.cfc?method=logOut",
            success: function(){
                location.reload();
            }
        });
    }
}

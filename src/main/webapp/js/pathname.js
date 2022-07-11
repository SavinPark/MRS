
/* 페이지의 URL pathname 과 같은 id값을 가진 메뉴태그에 class="active" 추가" */

let pathName = window.location.pathname;
// alert(pathName);
if (pathName === "/MRStest/" || pathName === "/MRStest/home") {
	// alert(pathName);
	document.getElementById("/MRStest/home").className = "active";	
	
} else if (pathName === "/MRStest/mypage" || 
		   pathName === "/MRStest/mypage/edit") {
	document.getElementById("/MRStest/mypage").className = "active";
	
} else if (pathName === "/MRStest/employee") {
	document.getElementById("/MRStest/employee").className = "active";	
} else if (pathName === "/MRStest/customer" || 
		   pathName === "/MRStest/customer/view" || 
		    pathName === "/MRStest/customer/edit" || 
		   pathName === "/MRStest/customer/add") {
	document.getElementById("/MRStest/customer").className = "active";	
	
} else if (pathName === "/MRStest/support" ||
           pathName === "/MRStest/support/view" ||
           pathName === "/MRStest/support/edit" ||
           pathName === "/MRStest/support/add") {
	document.getElementById("/MRStest/support").className = "active";	
	
} else {
	document.getElementById(pathName).className = "active";	
}
// alert(document.getElementById("/MRStest/home").className);

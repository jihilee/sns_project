package util;
// for jeon heouk ssi
public class Paging {
	//페이징 관련 변수	
	private int totalCount = 0 ; //총 레코드 건수
	private int totalPage = 0 ; //전체 페이지 수
	private int pageNumber = 0 ; //보여줄 페이지 넘버(표현 가능한 페이지는 1부터 totalPage까지이다.)
	private int pageSize = 0 ; //한 페이지에 보여줄 건수
	private int beginRow = 0 ; //현재 페이지의 시작 행
	private int endRow = 0 ; //현재 페이지의 끝 행
	private int pageCount = 3 ; // 한 화면에 보여줄 페이지 링크 수 (페이지 번호 갯수) 3개 페이지 이상 존재해야 다음 처음 끝 같은 버튼이 보여짐
	private int beginPage = 0 ; //페이징 처리 시작 페이지 번호
	private int endPage = 0 ; //페이징 처리 끝 페이지 번호
	private int offset = 0 ;
	private int limit = 0 ;
	private String url = "" ; //예시==>  http://localhost:9191/MyServlet/list.do
	private String pagingHtml = "";//하단의 숫자 페이지 링크
	
	private String whatColumn = "" ; //검색 모드(작성자, 글제목, 전체 검색은 all) 등등
	private String keyword = "" ; //검색할 단어 
	private String add2Name = "";
	private String pno = ""; // pno
	
	
	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getAdd2Name() {
		return add2Name;
	}

	public void setAdd2Name(String add2Name) {
		this.add2Name = add2Name;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public int getPageNumber() {
		return pageNumber;
	}


	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getBeginRow() {
		return beginRow;
	}


	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}


	public int getEndRow() {
		return endRow;
	}


	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}


	public int getPageCount() {
		return pageCount;
	}


	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}


	public int getBeginPage() {
		return beginPage;
	}


	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getOffset() {
		return offset;
	}


	public void setOffset(int offset) {
		this.offset = offset;
	}


	public int getLimit() {
		return limit;
	}


	public void setLimit(int limit) {
		this.limit = limit;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getPagingHtml() {
		System.out.println("pagingHtml:"+pagingHtml);
		
		return pagingHtml;
//		pagingHtml:
//			&nbsp;<font color='red'>1</font>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=2&pageSize=2&whatColumn=null&keyword=null'>2</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=3&pageSize=2&whatColumn=null&keyword=null'>3</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=4&pageSize=2&whatColumn=null&keyword=null'>4</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=5&pageSize=2&whatColumn=null&keyword=null'>5</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=6&pageSize=2&whatColumn=null&keyword=null'>6</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=7&pageSize=2&whatColumn=null&keyword=null'>7</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=8&pageSize=2&whatColumn=null&keyword=null'>8</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=9&pageSize=2&whatColumn=null&keyword=null'>9</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=10&pageSize=2&whatColumn=null&keyword=null'>10</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=11&pageSize=2&whatColumn=null&keyword=null'>����</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=22&pageSize=2&whatColumn=null&keyword=null'>�� ��</a>&nbsp;

	}


	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}


	public String getWhatColumn() {
		return whatColumn;
	}


	public void setWhatColumn(String whatColumn) {
		this.whatColumn = whatColumn;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Paging(
			String _pageNumber, 
			String _pageSize,  
			int totalCount,
			String url,
			String pno
			) {		

		if(  _pageNumber == null || _pageNumber.equals("null") || _pageNumber.equals("")  ){
			System.out.println("_pageNumber:"+_pageNumber); // null
			_pageNumber = "1" ; // _pageNumber가 null이면 여러 페이지중 1페이지부터 보여지게 하자라는 의미
		}
		this.pageNumber = Integer.parseInt( _pageNumber ) ; 

		if( _pageSize == null || _pageSize.equals("null") || _pageSize.equals("") ){
			_pageSize = "3" ; // 한 페이지에 보여줄 레코드 갯수
		}		
		this.pageSize = Integer.parseInt( _pageSize ) ;
		
		this.limit = pageSize ; // 한 페이지에 보여줄 레코드 갯수

		this.totalCount = totalCount ; 

		this.totalPage = (int)Math.ceil((double)this.totalCount / this.pageSize) ; // double 때문에 결과가 2.5가 나올 수 있는거지 원래는 정수가 나옴, ceil은 무조건 올림하는 함수
		
		//해당 페이지에서 보여줄 레코드의 시작과 끝을 정하는 부분
		this.beginRow = ( this.pageNumber - 1 )  * this.pageSize  + 1 ;
		this.endRow =  this.pageNumber * this.pageSize ;
		//맨 마지막 페이지에있던 레코드 하나가 삭제되면 바로 직전 페이지가 보여지도록 함.
		if( this.pageNumber > this.totalPage ){
			this.pageNumber = this.totalPage ;
		}
		
		//offset의미 : 한 페이지에서 2개씩 보여지는 상황이라 가정하면 1페이지 에서는 건너띌게 없으로 0,
		//			  2페이지에서는 건너띌게 2개 레코드 이므로 2,
		//			  3페이지에서는 건너뛸게 4개 레코드 이므로 4
		this.offset = ( pageNumber - 1 ) * pageSize ;  // 페이지 이동에 따라 건너띌 레코드 개수가 들어옴
		if( this.endRow > this.totalCount ){
			this.endRow = this.totalCount  ;
		}

		this.beginPage = ( this.pageNumber - 1 ) / this.pageCount * this.pageCount + 1  ;
		this.endPage = this.beginPage + this.pageCount - 1 ;
		System.out.println("pageNumber:"+pageNumber+"/totalPage:"+totalPage);	
		
		if( this.endPage > this.totalPage ){
			this.endPage = this.totalPage ;
		}
		
		this.url = url ; //  /ex/list.ab
		
		this.pno = pno;
		
		this.pagingHtml = getPagingHtml(url) ;  // 페이지 하단의 페이지 관련 코드들에 대한 html 코드가 문자열로 만들어져서 반환됨
	}
	

	public Paging(
			String _pageNumber, 
			String _pageSize,  
			int totalCount,
			String url, 
			String whatColumn, 
			String keyword
			) {		

		if(  _pageNumber == null || _pageNumber.equals("null") || _pageNumber.equals("")  ){
			System.out.println("_pageNumber:"+_pageNumber); // null
			_pageNumber = "1" ; // _pageNumber가 null이면 여러 페이지중 1페이지부터 보여지게 하자라는 의미
		}
		this.pageNumber = Integer.parseInt( _pageNumber ) ; 

		if( _pageSize == null || _pageSize.equals("null") || _pageSize.equals("") ){
			_pageSize = "3" ; // 한 페이지에 보여줄 레코드 갯수
		}		
		this.pageSize = Integer.parseInt( _pageSize ) ;
		
		this.limit = pageSize ; // 한 페이지에 보여줄 레코드 갯수

		this.totalCount = totalCount ; 

		this.totalPage = (int)Math.ceil((double)this.totalCount / this.pageSize) ; // double 때문에 결과가 2.5가 나올 수 있는거지 원래는 정수가 나옴, ceil은 무조건 올림하는 함수
		
		//해당 페이지에서 보여줄 레코드의 시작과 끝을 정하는 부분
		this.beginRow = ( this.pageNumber - 1 )  * this.pageSize  + 1 ;
		this.endRow =  this.pageNumber * this.pageSize ;
		//맨 마지막 페이지에있던 레코드 하나가 삭제되면 바로 직전 페이지가 보여지도록 함.
		if( this.pageNumber > this.totalPage ){
			this.pageNumber = this.totalPage ;
		}
		
		//offset의미 : 한 페이지에서 2개씩 보여지는 상황이라 가정하면 1페이지 에서는 건너띌게 없으로 0,
		//			  2페이지에서는 건너띌게 2개 레코드 이므로 2,
		//			  3페이지에서는 건너뛸게 4개 레코드 이므로 4
		this.offset = ( pageNumber - 1 ) * pageSize ;    // 페이지 이동에 따라 건너띌 레코드 개수가 들어옴
		if( this.endRow > this.totalCount ){
			this.endRow = this.totalCount  ;
		}

		this.beginPage = ( this.pageNumber - 1 ) / this.pageCount * this.pageCount + 1  ;
		this.endPage = this.beginPage + this.pageCount - 1 ;
		System.out.println("pageNumber:"+pageNumber+"/totalPage:"+totalPage);	
		
		if( this.endPage > this.totalPage ){
			this.endPage = this.totalPage ;
		}
		
		System.out.println("pageNumber2:"+pageNumber+"/totalPage2:"+totalPage);	
		this.url = url ; //  /ex/list.ab
		this.whatColumn = whatColumn ;
		this.keyword = keyword ;
		System.out.println("whatColumn:"+whatColumn+"/keyword:"+keyword);
		
		this.pagingHtml = getPagingHtml(url) ; // 페이지 하단의 페이지 관련 코드들에 대한 html 코드가 문자열로 만들어져서 반환됨
	
	}
	
	public Paging(
			String _pageNumber, 
			String _pageSize,  
			int totalCount,
			String url, 
			String whatColumn, 
			String keyword,
			String add2Name
			) {		

		if(  _pageNumber == null || _pageNumber.equals("null") || _pageNumber.equals("")  ){
			System.out.println("_pageNumber:"+_pageNumber); // null
			_pageNumber = "1" ; // _pageNumber가 null이면 여러 페이지중 1페이지부터 보여지게 하자라는 의미
		}
		this.pageNumber = Integer.parseInt( _pageNumber ) ; 

		if( _pageSize == null || _pageSize.equals("null") || _pageSize.equals("") ){
			_pageSize = "3" ; // 한 페이지에 보여줄 레코드 갯수
		}		
		this.pageSize = Integer.parseInt( _pageSize ) ;
		
		this.limit = pageSize ; // 한 페이지에 보여줄 레코드 갯수

		this.totalCount = totalCount ; 

		this.totalPage = (int)Math.ceil((double)this.totalCount / this.pageSize) ; // double 때문에 결과가 2.5가 나올 수 있는거지 원래는 정수가 나옴, ceil은 무조건 올림하는 함수
		
		//해당 페이지에서 보여줄 레코드의 시작과 끝을 정하는 부분
		this.beginRow = ( this.pageNumber - 1 )  * this.pageSize  + 1 ;
		this.endRow =  this.pageNumber * this.pageSize ;
		//맨 마지막 페이지에있던 레코드 하나가 삭제되면 바로 직전 페이지가 보여지도록 함.
		if( this.pageNumber > this.totalPage ){
			this.pageNumber = this.totalPage ;
		}
		
		//offset의미 : 한 페이지에서 2개씩 보여지는 상황이라 가정하면 1페이지 에서는 건너띌게 없으로 0,
		//			  2페이지에서는 건너띌게 2개 레코드 이므로 2,
		//			  3페이지에서는 건너뛸게 4개 레코드 이므로 4
this.offset = ( pageNumber - 1 ) * pageSize ;  // 페이지 이동에 따라 건너띌 레코드 개수가 들어옴
		if( this.endRow > this.totalCount ){
			this.endRow = this.totalCount  ;
		}

		this.beginPage = ( this.pageNumber - 1 ) / this.pageCount * this.pageCount + 1  ;
		this.endPage = this.beginPage + this.pageCount - 1 ;
		System.out.println("pageNumber:"+pageNumber+"/totalPage:"+totalPage);	
		
		if( this.endPage > this.totalPage ){
			this.endPage = this.totalPage ;
		}
		
		System.out.println("pageNumber2:"+pageNumber+"/totalPage2:"+totalPage);	
		this.url = url ; //  /ex/list.ab
		this.whatColumn = whatColumn ;
		this.keyword = keyword ;
		System.out.println("whatColumn:"+whatColumn+"/keyword:"+keyword);
		this.add2Name = add2Name;
		
		this.pagingHtml = getPagingHtml(url) ; // 페이지 하단의 페이지 관련 코드들에 대한 html 코드가 문자열로 만들어져서 반환됨
	
	}
	
	private String getPagingHtml( String url ){ //페이징 문자열을 만든다.
		System.out.println("getPagingHtml url:"+url); // 
		
		String result = "" ;
		String added_param = "&whatColumn=" + whatColumn + "&keyword=" + keyword + "&add2Name=" + add2Name + "&no=" + pno; 
		
		if (this.beginPage != 1) { // 앞쪽, pageSize:한 화면에 보이는 레코드 수
			result += "&nbsp;<a href='" + url  
					+ "?pageNumber=" + ( 1 ) + "&pageSize=" + this.pageSize 
					+ added_param + "'>�� ó��</a>&nbsp;" ;
			result += "&nbsp;<a href='" + url 
					+ "?pageNumber=" + (this.beginPage - 1 ) + "&pageSize=" + this.pageSize 
					+ added_param + "'>����</a>&nbsp;" ;
		}
		
		//가운데(1,2,3 페이지 보여주는 코드)
		for (int i = this.beginPage; i <= this.endPage ; i++) {
			if ( i == this.pageNumber ) {
				result += "&nbsp;<font color='red'>" + i + "</font>&nbsp;"	; // 선택한 번호는 빨간색으로 보이게 해라
						
			} else {
				// 나중에 result 변수 한번 출력해봐라. 검색을 하지 않은 2페이지 에서는 result =  /ex/list.ab/?pageNum=2&pageSize=2&whatColumn=null&keyword=null
				result += "&nbsp;<a href='" + url   
						+ "?pageNumber=" + i + "&pageSize=" + this.pageSize 
						+ added_param + "'>" + i + "</a>&nbsp;" ;
				
			}
		}
		System.out.println("result:"+result);  
		System.out.println();
		
		if ( this.endPage != this.totalPage) { // 뒤쪽(다음과 맨끝을 조건에 따라 나올수도 있고 안나올수도 있게)
			
			result += "&nbsp;<a href='" + url  
					+ "?pageNumber=" + (this.endPage + 1 ) + "&pageSize=" + this.pageSize 
					+ added_param + "'>����</a>&nbsp;" ;
			
			result += "&nbsp;<a href='" + url  
					+ "?pageNumber=" + (this.totalPage ) + "&pageSize=" + this.pageSize 
					+ added_param + "'>�� ��</a>&nbsp;" ;
		}		
		System.out.println("result2:"+result);
		
		return result ;
	}	
	
}


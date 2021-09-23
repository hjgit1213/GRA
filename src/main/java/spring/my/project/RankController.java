package spring.my.project;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class RankController {
	
	@Autowired
	private RankService rankService  ;
	
	private static final Logger logger = LoggerFactory.getLogger(RankController.class) ;
	
	// 메인페이지 호출
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String Main(PCRankBean pcRankBean, MobileRankBean mobileRankBean,Model model) {
		logger.info("메인페이지가 호출되었습니다.");		
		
		ArrayList pcRankList =  rankService.PCRank(pcRankBean); 
		model.addAttribute("PCRank",pcRankList) ;
		
		ArrayList mobileRankList =  rankService.MobileRank(mobileRankBean); 
		model.addAttribute("mobileRank",mobileRankList); 
		
		return "rank/index";
	}
	
	// 회원가입 폼
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String joinForm(Model model) {
		logger.info("회원가입 폼이 호출되었습니다.");		
		model.addAttribute("rankBean", new RankBean());
		return "rank/join";
	}
	
	// 아이디 중복확인
	@RequestMapping(value="/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public String idCheck(@RequestParam("id") String user_id, RankBean rankbean, Model model) {
		
		logger.info("아이디 중복확인이 호출되었습니다.");				
		int result = rankService.joinIdCheck(user_id);
		if(result != 0) {
			return "fail";	// 중복아이디 존재
		}else {
			return "success";	// 중복아이디 없음			
		}
	}
	
	// 닉네임 중복확인
		@RequestMapping(value="/nameCheck", method = RequestMethod.GET)
		@ResponseBody
		public String nameCheck(@RequestParam("name") String user_name, RankBean rankbean, Model model) {
			
			logger.info("닉네임 중복확인이 호출되었습니다.");				
			int result = rankService.joinNameCheck(user_name);
			if(result != 0) {
				return "fail";	// 중복닉네임 존재
			}else {
				return "success";	// 중복닉네임 없음			
			}
		}
	
	// 회원가입 처리
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String joinPro(RankBean rankBean, Model model) {
		
		logger.info("회원가입 처리가 호출되었습니다.");
		//System.out.println(rankBean.toString());
		int result = rankService.userJoin(rankBean);
		
		model.addAttribute("result", result);
		return "rank/joinOk";
	}
	
	// 로그인 폼 처리
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String loginGet(Model model) {
		logger.info("로그인 폼이 호출되었습니다.");
		model.addAttribute("rankBean", new RankBean());
		return "rank/login";
	}
	
	// 로그인 처리
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String userLogin(RankBean rankBean, HttpServletRequest request, RedirectAttributes rttr, Model model) throws Exception{
			
		logger.info("로그인 처리가 호출되었습니다.");
		
		HttpSession session = request.getSession();
		//System.out.println(rankBean.toString());
		RankBean rb = rankService.userLogin(rankBean);
		//rankService.userLogin(rankBean);
		
		if(rb == null) { // 로그인 실패
			session.setAttribute("member", null);
			//rttr.addFlashAttribute("msg", false);
			model.addAttribute("msg", false);
			//model.addAttribute("user",rb);
		} else {
			session.setAttribute("member", rb); // 성공
			logger.info("로그인 성공!");
		}
		
		return "rank/login"; 
	}
		
	
	// 로그아웃
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String userLogout(HttpSession session) {
		logger.info("로그아웃이 호출되었습니다.");
		session.invalidate();
		
		return "rank/login";
	}
	
	// PC 랭킹 보기 처리  
	@RequestMapping(value = "/PCRank", method = RequestMethod.GET)
	public String PCTodayRank(PCRankBean pcRankBean, Model model) {
		
		logger.info("PC게임 순위 페이지가 호출되었습니다.");

		ArrayList allist =  rankService.PCRank(pcRankBean); 
		model.addAttribute("PCRank",allist) ; 

		return "rank/PCRank" ; 
	}
	
	// 모바일 랭킹 보기 처리  
	@RequestMapping(value = "/mobileRank", method = RequestMethod.GET)
	public String getMobileRank(MobileRankBean mobileRankBean, Model model) {

		logger.info("모바일 게임 순위 페이지가 호출되었습니다.");

		ArrayList allist =  rankService.MobileRank(mobileRankBean); 
		model.addAttribute("mobileRank",allist) ; 

		return "rank/mobileRank" ; 
	}
	
	// 1-0 자유게시판 글쓰기 폼 
	@RequestMapping(value = "/freeWriteForm", method = RequestMethod.GET)
	public String showFreeWrite (Model model) {
		
		logger.info("글쓰기 입력폼이 호출되었습니다.");
		
		model.addAttribute("rankBean",new RankBean()) ; 
		
		return "rank/freeWriteForm";
	}
	
	// 1-1 글쓰기 처리 
	@RequestMapping(value = "/freeWriteForm", method = RequestMethod.POST)
	public String freeWritePro(FreeRankBean freeBean, HttpServletRequest request, Model model) {
		
		logger.info("자유게시판 글쓰기 처리가 호출되었습니다.");
		HttpSession session = request.getSession();
		System.out.println(freeBean.toString());
		
		
		if(session.getAttribute("member")==null) {
			logger.info("로그인 후 시도할 것!");
			model.addAttribute("member", null);
		}else {
			model.addAttribute("member", session.getAttribute("member"));
			rankService.writeFree(freeBean); 
			logger.info("글 작성 성공");
		}
		
		return "rank/freeWriteOK"; 
	}
	
	// 2 글목록 처리 /listBoard.do?current_page=1  방식으로 호출한다. 
	@RequestMapping(value = "/freeList", method = RequestMethod.GET)
	public String freeList(@RequestParam("current_page") String pageForView,Model model) {
		logger.info("자유게시판 글목록이  호출되었습니다.");
		
		int totcnt = rankService.getFreeTotalCnt();
		ArrayList allist =  rankService.getFreeList(Integer.parseInt(pageForView), 10 ) ;
		
		model.addAttribute("totalCnt", totcnt ) ;
		model.addAttribute("current_page",pageForView) ; 
		model.addAttribute("freeList",allist) ; 
			
		return "rank/freeList" ; 
	}
		
	// 3 글보기  
	@RequestMapping(value = "/freeView", method = RequestMethod.GET)		
	public String freeView(@RequestParam("id_num") String id_num,
			@RequestParam("current_page") String current_page,				
			@RequestParam("searchStr") String searchStr
			,Model model) {
		logger.info("자유게시판 글보기가  호출되었습니다.");
		
		FreeRankBean freeBean = rankService.getFreeView(id_num) ;
			
		model.addAttribute("id_num", id_num ) ;
		model.addAttribute("searchStr", searchStr ) ;
		model.addAttribute("current_page",current_page) ; 
		model.addAttribute("freeBean",freeBean) ; 
			
		return "rank/freeView" ; 
	}
	
	// 4-1 글수정 폼 
	@RequestMapping(value = "/freeEdit", method = RequestMethod.GET)
	public String freeEdit(@RequestParam("id_num") String id_num,
					@RequestParam("current_page") String current_page
					,Model model) {
		logger.info("자유게시판 글 수정폼이  호출되었습니다.");
			
		FreeRankBean freeBean = rankService.getFreeEditView(id_num) ;
				
		model.addAttribute("id_num", id_num ) ;
		//	model.addAttribute("searchStr", searchStr ) ;
		model.addAttribute("current_page",current_page) ; 
		model.addAttribute("freeBean",freeBean) ; 
				
		return "rank/freeEdit" ; 
	}
	
	// 4-2 글수정 처리  찾는경로는 같지만 ,  방식이 post이기 때문에 구별된다. 
	@RequestMapping(value = "/freeEdit", method = RequestMethod.POST)
	public String freeEditOK(FreeRankBean freeBean,
			@RequestParam("current_page") String current_page
			,Model model) {
				
		logger.info("자유게시판 글 수정처리  호출되었습니다.");
			
		System.out.println(freeBean.toString());
		int result =  rankService.freeUpdate(freeBean) ;
		model.addAttribute("id_num", freeBean.getId_num() ) ;
		//	model.addAttribute("searchStr", searchStr ) ;
		model.addAttribute("current_page",current_page) ; 
		model.addAttribute("result",result) ; 
				
		return "rank/freeEditOK" ; 
	}
	
	// 5 글삭제하기 		
	@RequestMapping(value = "/freeDelete", method = RequestMethod.GET)
	public String freeDeleteOK (@RequestParam("id_num") int id_num,
			@RequestParam("current_page") String current_page, Model model) {

		logger.info("글삭제 처리가 호출 되었습니다.");

		// 삭체처리 
		int result = rankService.freeDelete(id_num);

		model.addAttribute("result",result) ; 
		model.addAttribute("current_page",current_page) ; 

		return "rank/freeDelete" ; 
	}
	
	// 글 검색하기  메서드를 지정치 않으면 post,get 모두 처리 가능함 
	@RequestMapping(value = "/freeSearch")
	public String freeSearch(@RequestParam("current_page") String pageForView,
			@RequestParam("searchStr") String searchStr 
			,Model model) {
		logger.info("자유게시판 글 검색이  호출되었습니다.");
		//System.out.println(searchStr+"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		String searchStr2 = "" ;
		try {
			searchStr2 = URLDecoder.decode(searchStr,"EUC-KR");
			System.out.println(searchStr+": 디코드 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		int searchCnt = rankService.getFreeSearchCnt(searchStr2);

		ArrayList allist =  rankService.getFreeSearchList
				(Integer.parseInt(pageForView), 2 , searchStr2 ) ;

		model.addAttribute("searchCnt", searchCnt ) ;
		model.addAttribute("current_page",pageForView) ; 
		model.addAttribute("freeList",allist) ; 
		try {
			searchStr = URLEncoder.encode(searchStr, "UTF-8") ;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("searchStr",searchStr) ; // 페이징 처리에서 사용함 

		return "rank/freeSearch" ; 
	}
	
	
	// 자료실 글쓰기 폼 
		@RequestMapping(value = "/fileWriteForm", method = RequestMethod.GET)
		public String showFileWrite (Model model) {
			
			logger.info("자료실 글쓰기 입력폼이 호출되었습니다.");
			
			model.addAttribute("rankBean",new RankBean()) ; 
			
			return "rank/fileWriteForm";
		}
		
	// 자료실 글 쓰기 처리
	@RequestMapping(value="/fileWriteForm", method = RequestMethod.POST) 
	public String fileWrite(FileRankBean fileBean, HttpServletRequest request, MultipartHttpServletRequest mtfRequest, Model model) throws IOException { 
		
		logger.info("자료실 글쓰기가 호출되었습니다.");		
		HttpSession session = request.getSession();	
		
		if(session.getAttribute("member")==null) { // 글쓰기 실패
			logger.info("로그인 후 시도할 것!");
			model.addAttribute("member", null);
			
		}else {	// 글쓰기 성공
			model.addAttribute("member", session.getAttribute("member"));
				
			String src = mtfRequest.getParameter("src");
	        System.out.println("src value : " + src);
	        MultipartFile mf = mtfRequest.getFile("uploadFile");
	        String path = "C:\\project_upload\\";
        	String originFileName = mf.getOriginalFilename(); // 원본 파일 명
        	String fileName = "";
	        if(!mf.isEmpty()) {
	        	//String root_path = request.getSession().getServletContext().getRealPath("/"); 
	        	
	        	long fileSize = mf.getSize(); // 파일 사이즈
	        	
	        	System.out.println("originFileName : " + originFileName);
	        	System.out.println("fileSize : " + fileSize);
	        	
	        	fileName = System.currentTimeMillis() + originFileName;
	        	String safeFile = path + fileName;
	        	
	        	try {
	        		mf.transferTo(new File(safeFile));
	        		fileBean.setRealFileName(originFileName);
	    	        fileBean.setFileName(fileName);
	        		
	        	} catch (IllegalStateException e) {
	        		// TODO Auto-generated catch block
	        		e.printStackTrace();
	        	} catch (IOException e) {
	        		// TODO Auto-generated catch block
	        		e.printStackTrace();
	        	}
	        }else {
	        	fileBean.setRealFileName("");
		        fileBean.setFileName("");
	        }
	        
	        rankService.fileInsert(fileBean);
	        logger.info("글 작성 성공");
	   			
		}     
		
		return "rank/fileWriteOK"; 
	}
	
	// 자료실 글 목록 보기 /listBoard.do?current_page=1  방식으로 호출한다. 
	@RequestMapping(value = "/fileList", method = RequestMethod.GET)
	public String fileList(@RequestParam("current_page") String pageForView, Model model) {
		logger.info("자료실 글목록이  호출되었습니다.");

		int totcnt = rankService.getFileTotalCnt();
		ArrayList allist =  rankService.getFileList(Integer.parseInt(pageForView), 10 ) ;
		
		model.addAttribute("totalCnt", totcnt ) ;
		model.addAttribute("current_page",pageForView) ; 
		model.addAttribute("fileList",allist) ; 

		return "rank/fileList" ; 
	}
	
	// 자료실 글 상세보기  
	@RequestMapping(value = "/fileView", method = RequestMethod.GET)		
	public String fileView(@RequestParam("id_num") String id_num,
			@RequestParam("current_page") String current_page,				
			@RequestParam("searchStr") String searchStr
			,Model model) {
		logger.info("자료실 글보기가  호출되었습니다.");

		FileRankBean fileBean = rankService.getFileView(id_num) ;

		model.addAttribute("id_num", id_num ) ;
		model.addAttribute("searchStr", searchStr ) ;
		model.addAttribute("current_page",current_page) ; 
		model.addAttribute("fileBean",fileBean) ; 

		return "rank/fileView"; 
	}

	// 자료실 글 수정 폼 
	@RequestMapping(value = "/fileEdit", method = RequestMethod.GET)
	public String fileEdit(@RequestParam("id_num") String id_num,
			@RequestParam("current_page") String current_page
			,Model model) {
		logger.info("자료실 글 수정폼이  호출되었습니다.");

		FileRankBean fileBean = rankService.getFileEditView(id_num) ;

		model.addAttribute("id_num", id_num ) ;	
		model.addAttribute("current_page",current_page) ; 
		model.addAttribute("fileBean",fileBean) ; 

		return "rank/fileEdit" ; 
	}
	
	// 자료실 글 수정 처리  찾는경로는 같지만 ,  방식이 post이기 때문에 구별된다. 
	@RequestMapping(value = "/fileEdit", method = RequestMethod.POST)
	public String fileEditOK(FileRankBean fileBean, HttpServletRequest request
			, @RequestParam("current_page") String current_page , MultipartHttpServletRequest mtfRequest
			, Model model) throws IllegalAccessException, IOException{
		logger.info("자료실 글 수정처리가 호출되었습니다.");		
		HttpSession session = request.getSession();	
		
		if(session.getAttribute("member")==null) { // 로그인 안함
			logger.info("로그인 후 시도할 것!");
			model.addAttribute("member", null);
			
		}else {	// 로그인 함
			model.addAttribute("member", session.getAttribute("member"));
	
	        MultipartFile mf = mtfRequest.getFile("uploadFile");
	        String path = "C:\\project_upload\\";
	        String oldFileName = request.getParameter("old_fileName");	//예전 파일명
	        String oldRealFileName = request.getParameter("old_realFileName");	//예전 실제파일명
        	String originFileName = mf.getOriginalFilename(); // 원본 파일 명
        	String fileName = "";
        	
	        if(!mf.isEmpty()) { // 파일 선택한게 있을때
	        	//String root_path = request.getSession().getServletContext().getRealPath("/"); 
	        	System.out.println(path + oldFileName);
	        	File file = new File(path + oldFileName);
	        	if(file.exists()) {
	        		if(file.delete()){ 
	        			System.out.println("기존파일삭제 성공"); 
	        		}else{ 
	        			System.out.println("기존파일삭제 실패"); 
	        		}
	        	}
	        	
	        	long fileSize = mf.getSize(); // 파일 사이즈
	        	
	        	System.out.println("originFileName : " + originFileName);
	        	System.out.println("fileSize : " + fileSize);
	        	
	        	fileName = System.currentTimeMillis() + originFileName;
	        	String safeFile = path + fileName;
	        	
	        	try {
	        		mf.transferTo(new File(safeFile));
	        		fileBean.setRealFileName(originFileName);
	    	        fileBean.setFileName(fileName);
	        		
	        	} catch (IllegalStateException e) {
	        		// TODO Auto-generated catch block
	        		e.printStackTrace();
	        	} catch (IOException e) {
	        		// TODO Auto-generated catch block
	        		e.printStackTrace();
	        	}
	        }else {  // 파일 선택한게 없을때
	        	
	        	fileBean.setRealFileName(oldRealFileName);
		        fileBean.setFileName(oldFileName);
	        }
	        
	        rankService.fileUpdate(fileBean);
	        model.addAttribute("result", 1 ) ;
	        model.addAttribute("current_page",current_page) ; 
			model.addAttribute("fileBean",fileBean) ; 
	        logger.info("자료실 글 수정 성공");
	   			
		}     
		
		return "rank/fileEditOK";
	}
	
	// 자료실 글삭제하기 		
	@RequestMapping(value = "/fileDelete", method = RequestMethod.GET)
	public String fileDeleteOK (@RequestParam("id_num") int id_num, HttpServletRequest request,
			@RequestParam("current_page") String current_page, Model model) {

		logger.info("자료실 글삭제 처리가 호출 되었습니다.");
		
		String path = "C:\\project_upload\\";
        String fileName = request.getParameter("fileName");	//예전 파일명
		
		File file = new File(path + fileName);
    	if(file.exists()) {
    		if(file.delete()){ 
    			System.out.println("파일삭제 성공"); 
    		}else{ 
    			System.out.println("파일삭제 실패"); 
    		}
    	}
		
		// 삭체처리 
		int result = rankService.fileDelete(id_num);

		model.addAttribute("result",result) ; 
		model.addAttribute("current_page",current_page) ; 

		return "rank/fileDelete" ; 
	}
	
	
	// 자료실 글 검색하기  메서드를 지정치 않으면 post,get 모두 처리 가능함 
	@RequestMapping(value = "/fileSearch")
	public String fileSearch(@RequestParam("current_page") String pageForView,
			@RequestParam("searchStr") String searchStr 
			,Model model) {
		logger.info("자료실 글 검색이  호출되었습니다.");
		//System.out.println(searchStr+"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		String searchStr2 = "" ;
		try {
			searchStr2 = URLDecoder.decode(searchStr,"EUC-KR");
			//System.out.println(searchStr+": 디코드 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		int searchCnt = rankService.getFileSearchCnt(searchStr2);

		ArrayList allist =  rankService.getFileSearchList
				(Integer.parseInt(pageForView), 2 , searchStr2 ) ;

		model.addAttribute("searchCnt", searchCnt ) ;
		model.addAttribute("current_page",pageForView) ; 
		model.addAttribute("fileList",allist) ; 
		try {
			searchStr = URLEncoder.encode(searchStr, "UTF-8") ;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("searchStr",searchStr) ; // 페이징 처리에서 사용함 

		return "rank/fileSearch" ; 
	}
}

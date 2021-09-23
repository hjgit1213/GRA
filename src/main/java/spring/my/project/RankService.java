package spring.my.project;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class RankService {
	
	@Autowired
	private RankMapper rankMapper;
	
	// 회원가입
	public int userJoin(RankBean rankBean) {
		return rankMapper.userJoin(rankBean);
	}
	
	// 아이디 중복체크
	public int joinIdCheck(String user_id) {
		return rankMapper.joinIdCheck(user_id);
	}
	
	// 닉네임 중복체크
	public int joinNameCheck(String user_name) {
		return rankMapper.joinNameCheck(user_name);
	}
	
	//로그인
	public RankBean userLogin(RankBean rankBean) {
		return rankMapper.userLogin(rankBean);
	}
	
	// PC 랭킹
	public ArrayList<PCRankBean> PCRank(PCRankBean pcRankBean){
		return rankMapper.PCRank(pcRankBean);
	}
	
	// PC 랭킹
	public ArrayList<MobileRankBean> MobileRank(MobileRankBean mobileRankBean){
		return rankMapper.MobileRank(mobileRankBean);
	}
	
	// 자유게시판 글 입력 하기 
	public void writeFree(FreeRankBean freeBean) {
		rankMapper.writeFree(freeBean);
	}
	
	// 자유게시판 글갯수 반환 
	public int getFreeTotalCnt() {
		return rankMapper.getFreeTotalCnt() ;
	}
	
	// 자유게시판 글 일부 반환 (글목록)
	public ArrayList<FreeRankBean> getFreeList(int pagenum,int listnum) {
		return rankMapper.getFreeList(pagenum, listnum) ;
	}
	
	// 글보기 
	public FreeRankBean getFreeView(String id) {
		// 조회수 증가 
		rankMapper.freeHitUp(id) ;
		// 해당글 리턴 
		return rankMapper.getFreeView(id) ; 
	}
	
	// 글수정폼 
	public FreeRankBean getFreeEditView(String id) {
		// 원글 리턴 
		return rankMapper.getFreeView(id) ; 
	}
	
	// 수정 처리 
	public int freeUpdate(FreeRankBean freeBean) {
		System.out.println(freeBean.toString());
		return	rankMapper.freeUpdate(freeBean);
	}
	
	// 글삭제처리 
	public int freeDelete(int id) {
		return rankMapper.freeDelete(id); 
	}
	
	// 글검색갯수 
	public int getFreeSearchCnt(String searchStr) {
		return rankMapper.getFreeSearchCnt(searchStr) ;
	}
	
	// 글검색  
	public ArrayList<FreeRankBean> getFreeSearchList(int pageNum,int rowsNum,String searchStr) {
		return rankMapper.getFreeSearchList(pageNum, rowsNum ,searchStr) ;
	}
	
	// 자료실 글 입력 하기 
	public void fileInsert(FileRankBean fileBean) {
		rankMapper.fileInsert(fileBean);
	}
	
	// 자료실 글갯수 반환 
	public int getFileTotalCnt() {
		return rankMapper.getFileTotalCnt() ;
	}

	// 자료실 글 일부 반환 (글목록)
	public ArrayList<FileRankBean> getFileList(int pagenum,int listnum) {
		return rankMapper.getFileList(pagenum, listnum) ;
	}
	
	// 자료실 글 상세보기 
	public FileRankBean getFileView(String id) {
		// 조회수 증가 
		rankMapper.fileHitUp(id) ;
		// 해당글 리턴 
		return rankMapper.getFileView(id); 
	}
	
	// 글수정폼 
	public FileRankBean getFileEditView(String id) {
		// 원글 리턴 
		return rankMapper.getFileView(id) ; 
	}

	// 수정 처리 
	public int fileUpdate(FileRankBean fileBean) {
		System.out.println(fileBean.toString());
		return	rankMapper.fileUpdate(fileBean);
	}
	
	// 글삭제처리 
	public int fileDelete(int id) {
		return rankMapper.fileDelete(id); 
	}
	
	// 글검색갯수 
	public int getFileSearchCnt(String searchStr) {
		return rankMapper.getFileSearchCnt(searchStr) ;
	}

	// 글검색  
	public ArrayList<FileRankBean> getFileSearchList(int pageNum,int rowsNum,String searchStr) {
		return rankMapper.getFileSearchList(pageNum, rowsNum ,searchStr) ;
	}

	
}
	

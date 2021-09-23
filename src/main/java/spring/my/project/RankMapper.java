package spring.my.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;


@Repository
public interface RankMapper {
	
	// 회원가입
	final String JOIN = "insert into member (id, passwd, name, mail)"
			+ " values (#{id}, #{passwd}, #{name}, #{mail}) ";
	
	@Insert(JOIN)
	int userJoin(RankBean rankBean);
	
	//아이디 중복확인
	final String JOIN_IDCHECK = "select count(*) from member where id = #{id}";
	
	@Select(JOIN_IDCHECK)
	int joinIdCheck(String user_id);
	
	//아이디 중복확인
	final String JOIN_NAMECHECK = "select count(*) from member where name = #{name}";
	
	@Select(JOIN_NAMECHECK)
	int joinNameCheck(String user_name);
	
	// 로그인
	final String LOGIN = "select * from member where id = #{id} and passwd = #{passwd}";
	
	@Select(LOGIN)
	RankBean userLogin(RankBean rankBean);
	
	//=========================================================================================
	
	// PC방 게임 순위
	final String PCRANK = "select * from PCRank";
		
	@Select(PCRANK)
	ArrayList<PCRankBean> PCRank(PCRankBean pcRankBean);
	
	// PC방 게임 순위
	final String MOBILERANK = "select * from MobileRank";

	@Select(MOBILERANK)
	ArrayList<MobileRankBean> MobileRank(MobileRankBean mobileRankBean);
	
	//=========================================================================================
	
	final String FREE_INSERT = "insert into freeBoard (id_num, name, subject, content, create_date, hits)"
			+ " values (seq_num.nextval, #{name}, #{subject}, #{content}, sysdate, 0) ";
	
	@Insert(FREE_INSERT)
	void writeFree(FreeRankBean freeBean);
	
	// 글목록  - 글갯수 
    final String FREE_CNT_ALL = "select count(1) from freeBoard" ;
    @Select(FREE_CNT_ALL)
    int getFreeTotalCnt() ; 
    
    
    // 글목록 - 일부반환 
    final String FREE_LIST = "select * from ( select a.*, ceil(rownum/#{rowsPerPage}) as page from ("
    		+ "select id_num, name, subject, content, create_date, hits from freeBoard order by id_num desc ) a ) b where b.page=#{page}" ;
    @Select(FREE_LIST)
    @Results(id = "freeResult", value={
			@Result(property = "id_num",column = "id_num") ,
			@Result(property = "name",column = "name") ,
			@Result(property = "subject",column = "subject") ,
			@Result(property = "content",column = "content") ,
			@Result(property = "create_date",column = "create_date") ,
			@Result(property = "hits",column = "hits") } )
    ArrayList<FreeRankBean> getFreeList(@Param("page") int page, @Param("rowsPerPage") int rowsPerPage);
	
    // 글 상세보기
    final String FREE_VIEW = "select id_num, name, subject, content, create_date, hits"
    		+ " from freeBoard where id_num=#{id_num}";
    
    @Select(FREE_VIEW)
    @ResultMap("freeResult")
    FreeRankBean getFreeView(@Param("id_num") String id_num) ;
    
    // 조회수 올리기 
    final String FREE_HIT_UP = "update freeBoard set hits=hits+1 where id_num=#{id_num}";
    
    @Update(FREE_HIT_UP)
    void freeHitUp(@Param("id_num") String id_num) ;
    
    // 글수정 처리
    final String FREE_UPDATE = "update freeBoard set "
    		+ "subject=#{subject}, "
    		+ "content=#{content}, "
    		+ "create_date=sysdate "
    		+ "where id_num=#{id_num}";
    
    @Update(FREE_UPDATE)
    int freeUpdate(FreeRankBean freeBean) ;
    
    // 글삭제     
    final String FREE_DELETE = " delete from freeBoard where id_num=#{id_num} " ;

    @Delete(FREE_DELETE) 
    int freeDelete(@Param("id_num") int id_num);
    
    // 자유게시판 글검색 갯수 
    final String FREE_SEARCH_CNT = "select count(1) from freeBoard where "
    		+ "subject like '%'||'${searchStr}'||'%'" ;
    @Select(FREE_SEARCH_CNT)
    int getFreeSearchCnt(@Param("searchStr") String searchStr) ; 

    // 자유게시판 글검색 
    final String FREE_SEARCH_STR = " select b.* from ( select a.*, ceil(rownum/#{rowsPerPage}) as page from ("
    		+ " select id_num, name, subject, content, create_date, hits from freeBoard "
    		+ " where subject like '%'||'${searchStr}'||'%' ) a ) b where b.page=#{page}" ;

    @Select(FREE_SEARCH_STR)
    @ResultMap("freeResult")
    ArrayList<FreeRankBean> getFreeSearchList(@Param("page") int page, 
    		@Param("rowsPerPage") int rowsPerPage, 
    		@Param("searchStr") String searchStr);
    
    //=========================================================================================
    
    // 자료실 글 입력하기
    final String FILE_INSERT = "INSERT INTO fileBoard(id_num, name, subject, content, file_name, realFile_name, create_date, hits)" + 
    		" VALUES(file_seq_num.nextval, #{name}, #{subject}, #{content}, #{fileName}, #{realFileName}, sysdate, 0)";
    
    @Insert(FILE_INSERT)
	void fileInsert(FileRankBean fileBean);
    
    // 자료실 글목록  - 글갯수 
    final String FILE_CNT_ALL = "select count(1) from fileBoard" ;
    @Select(FILE_CNT_ALL)
    int getFileTotalCnt() ; 
        
    // 자료실 글목록 - 일부반환 
    final String FILE_LIST = "select * from ( select a.*, ceil(rownum/#{rowsPerPage}) as page from ("
    		+ "select id_num, name, subject, content, file_name, realFile_name, create_date, hits from fileBoard order by id_num desc ) a ) b where b.page=#{page}" ;
    @Select(FILE_LIST)
    @Results(id = "fileResult", value={
			@Result(property = "id_num",column = "id_num") ,
			@Result(property = "name",column = "name") ,
			@Result(property = "subject",column = "subject") ,
			@Result(property = "content",column = "content") ,
			@Result(property = "fileName",column = "file_name") ,
			@Result(property = "realFileName",column = "realFile_name") ,
			@Result(property = "create_date",column = "create_date") ,
			@Result(property = "hits",column = "hits") } )
    ArrayList<FileRankBean> getFileList(@Param("page") int page, @Param("rowsPerPage") int rowsPerPage);

    // 자료실 글 상세보기
    final String FILE_VIEW = "select id_num, name, subject, content, file_name, realFile_name, create_date, hits"
    		+ " from fileBoard where id_num=#{id_num}";
    
    @Select(FILE_VIEW)
    @ResultMap("fileResult")
    FileRankBean getFileView(@Param("id_num") String id_num) ;
    
    // 자료실 조회수 올리기 
    final String FILE_HIT_UP = "update fileBoard set hits=hits+1 where id_num=#{id_num}";
    
    @Update(FILE_HIT_UP)
    void fileHitUp(@Param("id_num") String id_num) ;
    
    // 자료실 글수정 처리
    final String FILE_UPDATE = "update fileBoard set "
    		+ "subject=#{subject}, "
    		+ "content=#{content}, "
    		+ "file_name=#{fileName}, "
    		+ "realFile_name=#{realFileName}, "
    		+ "create_date=sysdate "
    		+ "where id_num=#{id_num}";
    
    @Update(FILE_UPDATE)
    int fileUpdate(FileRankBean fileBean) ;
    
    // 자료실 글삭제     
    final String FILE_DELETE = " delete from fileBoard where id_num=#{id_num} " ;

    @Delete(FILE_DELETE) 
    int fileDelete(@Param("id_num") int id_num);
    
    // 자료실 글검색 갯수 
    final String FILE_SEARCH_CNT = "select count(1) from fileBoard where "
    		+ "subject like '%'||'${searchStr}'||'%'" ;
    @Select(FILE_SEARCH_CNT)
    int getFileSearchCnt(@Param("searchStr") String searchStr) ; 

    // 자료실 글검색 
    final String FILE_SEARCH_STR = " select b.* from ( select a.*, ceil(rownum/#{rowsPerPage}) as page from ("
    		+ " select id_num, name, subject, content, create_date, hits from fileBoard "
    		+ " where subject like '%'||'${searchStr}'||'%' ) a ) b where b.page=#{page}" ;

    @Select(FILE_SEARCH_STR)
    @ResultMap("fileResult")
    ArrayList<FileRankBean> getFileSearchList(@Param("page") int page, 
    		@Param("rowsPerPage") int rowsPerPage, 
    		@Param("searchStr") String searchStr);
} 

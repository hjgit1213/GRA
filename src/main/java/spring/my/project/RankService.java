package spring.my.project;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class RankService {
	
	@Autowired
	private RankMapper rankMapper;
	
	// ȸ������
	public int userJoin(RankBean rankBean) {
		return rankMapper.userJoin(rankBean);
	}
	
	// ���̵� �ߺ�üũ
	public int joinIdCheck(String user_id) {
		return rankMapper.joinIdCheck(user_id);
	}
	
	// �г��� �ߺ�üũ
	public int joinNameCheck(String user_name) {
		return rankMapper.joinNameCheck(user_name);
	}
	
	//�α���
	public RankBean userLogin(RankBean rankBean) {
		return rankMapper.userLogin(rankBean);
	}
	
	// PC ��ŷ
	public ArrayList<PCRankBean> PCRank(PCRankBean pcRankBean){
		return rankMapper.PCRank(pcRankBean);
	}
	
	// PC ��ŷ
	public ArrayList<MobileRankBean> MobileRank(MobileRankBean mobileRankBean){
		return rankMapper.MobileRank(mobileRankBean);
	}
	
	// �����Խ��� �� �Է� �ϱ� 
	public void writeFree(FreeRankBean freeBean) {
		rankMapper.writeFree(freeBean);
	}
	
	// �����Խ��� �۰��� ��ȯ 
	public int getFreeTotalCnt() {
		return rankMapper.getFreeTotalCnt() ;
	}
	
	// �����Խ��� �� �Ϻ� ��ȯ (�۸��)
	public ArrayList<FreeRankBean> getFreeList(int pagenum,int listnum) {
		return rankMapper.getFreeList(pagenum, listnum) ;
	}
	
	// �ۺ��� 
	public FreeRankBean getFreeView(String id) {
		// ��ȸ�� ���� 
		rankMapper.freeHitUp(id) ;
		// �ش�� ���� 
		return rankMapper.getFreeView(id) ; 
	}
	
	// �ۼ����� 
	public FreeRankBean getFreeEditView(String id) {
		// ���� ���� 
		return rankMapper.getFreeView(id) ; 
	}
	
	// ���� ó�� 
	public int freeUpdate(FreeRankBean freeBean) {
		System.out.println(freeBean.toString());
		return	rankMapper.freeUpdate(freeBean);
	}
	
	// �ۻ���ó�� 
	public int freeDelete(int id) {
		return rankMapper.freeDelete(id); 
	}
	
	// �۰˻����� 
	public int getFreeSearchCnt(String searchStr) {
		return rankMapper.getFreeSearchCnt(searchStr) ;
	}
	
	// �۰˻�  
	public ArrayList<FreeRankBean> getFreeSearchList(int pageNum,int rowsNum,String searchStr) {
		return rankMapper.getFreeSearchList(pageNum, rowsNum ,searchStr) ;
	}
	
	// �ڷ�� �� �Է� �ϱ� 
	public void fileInsert(FileRankBean fileBean) {
		rankMapper.fileInsert(fileBean);
	}
	
	// �ڷ�� �۰��� ��ȯ 
	public int getFileTotalCnt() {
		return rankMapper.getFileTotalCnt() ;
	}

	// �ڷ�� �� �Ϻ� ��ȯ (�۸��)
	public ArrayList<FileRankBean> getFileList(int pagenum,int listnum) {
		return rankMapper.getFileList(pagenum, listnum) ;
	}
	
	// �ڷ�� �� �󼼺��� 
	public FileRankBean getFileView(String id) {
		// ��ȸ�� ���� 
		rankMapper.fileHitUp(id) ;
		// �ش�� ���� 
		return rankMapper.getFileView(id); 
	}
	
	// �ۼ����� 
	public FileRankBean getFileEditView(String id) {
		// ���� ���� 
		return rankMapper.getFileView(id) ; 
	}

	// ���� ó�� 
	public int fileUpdate(FileRankBean fileBean) {
		System.out.println(fileBean.toString());
		return	rankMapper.fileUpdate(fileBean);
	}
	
	// �ۻ���ó�� 
	public int fileDelete(int id) {
		return rankMapper.fileDelete(id); 
	}
	
	// �۰˻����� 
	public int getFileSearchCnt(String searchStr) {
		return rankMapper.getFileSearchCnt(searchStr) ;
	}

	// �۰˻�  
	public ArrayList<FileRankBean> getFileSearchList(int pageNum,int rowsNum,String searchStr) {
		return rankMapper.getFileSearchList(pageNum, rowsNum ,searchStr) ;
	}

	
}
	

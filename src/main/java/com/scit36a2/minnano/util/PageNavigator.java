package com.scit36a2.minnano.util;

public class PageNavigator {
	// 멤버
	private final int countPerPage = 4; // 한 페이지당 글개수
	private final int pagePerGroup = 3; // 페이지 그룹
	private int currentPage; // 현재 페이지
	private int totalRecordCount; // 전체 글 개수
	private int totalPageCount; // 총 페이지수
	private int currentGroup; // 현재 그룹
	private int startPageGroup; // 현재 그룹의 첫 페이지
	private int endPageGroup; // 현재 그룹의 마지막 페이지
	private int startRecord; // 전체 레코드 중 현재 페이지의 첫 글의 위치

	// constructor
	// 총 글개수 : 152개라고 가정
	// 요청페이지 : 8 페이지라고 가정
	// 8페이지의 첫번째 레코드 번호
	// 8페이지의 마지막 레코드 번호
	// 8페이지가 속한 그룹의 첫번째 그룹번호
	// 8페이지가 속한 그룹의 마지막 그룹번호
	public PageNavigator(int currentPage, int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;

		totalPageCount = (totalRecordCount + countPerPage - 1) / countPerPage;

		if (currentPage < 1)
			currentPage = 1;
		if (currentPage > totalPageCount)
			currentPage = totalPageCount;

		this.currentPage = currentPage;

		// 8페이지 요청시 몇번째 그룹 : 1번 그룹
		currentGroup = (currentPage - 1) / pagePerGroup;

		// 6
		startPageGroup = currentGroup * pagePerGroup + 1;
		startPageGroup = startPageGroup < 1 ? 1 : startPageGroup;

		// 10
		endPageGroup = startPageGroup + pagePerGroup - 1;
		endPageGroup = endPageGroup < totalPageCount ? endPageGroup : totalPageCount;

		startRecord = (currentPage - 1) * countPerPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getCurrentGroup() {
		return currentGroup;
	}

	public void setCurrentGroup(int currentGroup) {
		this.currentGroup = currentGroup;
	}

	public int getStartPageGroup() {
		return startPageGroup;
	}

	public void setStartPageGroup(int startPageGroup) {
		this.startPageGroup = startPageGroup;
	}

	public int getEndPageGroup() {
		return endPageGroup;
	}

	public void setEndPageGroup(int endPageGroup) {
		this.endPageGroup = endPageGroup;
	}

	public int getStartRecord() {
		return startRecord;
	}

	public void setStartRecord(int startRecord) {
		this.startRecord = startRecord;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public int getPagePerGroup() {
		return pagePerGroup;
	}

	@Override
	public String toString() {
		return "PageNavigator [countPerPage=" + countPerPage + ", pagePerGroup=" + pagePerGroup + ", currentPage="
				+ currentPage + ", totalRecordCount=" + totalRecordCount + ", totalPageCount=" + totalPageCount
				+ ", currentGroup=" + currentGroup + ", startPageGroup=" + startPageGroup + ", endPageGroup="
				+ endPageGroup + ", startRecord=" + startRecord + "]";
	}
}

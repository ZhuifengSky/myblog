package com.blog.modules.post.bean;

import com.blog.common.bean.BaseEntity;

public class ArticleBean extends BaseEntity<ArticleBean> {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    private String title;

    private String subTitle;

    private String descStr;

    private Integer authorId;

    private Integer categoryId;

    private String authorName;
    
    private String categoryName;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public String getDescStr() {
		return descStr;
	}

	public void setDescStr(String descStr) {
		this.descStr = descStr;
	}

	public Integer getAuthorId() {
		return authorId;
	}

	public void setAuthorId(Integer authorId) {
		this.authorId = authorId;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

   
}
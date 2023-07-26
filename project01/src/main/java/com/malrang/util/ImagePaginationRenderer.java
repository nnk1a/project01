package com.malrang.util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class ImagePaginationRenderer extends AbstractPaginationRenderer {
 
   public ImagePaginationRenderer() {
      firstPageLabel = "<a href=\"#\" class=\"first\" onclick=\"{0}({1}); return false;\">처음 페이지</a>&#160;"; 
      previousPageLabel = "<a href=\"#\" class=\"label\" onclick=\"{0}({1}); return false;\"><image src=\"./img/previous.png\" border=0/></a>&#160;";
      currentPageLabel = "<strong>{0}</strong>&#160;";
      otherPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a>&#160;";
      nextPageLabel = "<a href=\"#\" class=\"label\" onclick=\"{0}({1}); return false;\"><image src=\"./img/next.png\" border=0/></a>&#160;";
      lastPageLabel = "<a href=\"#\" class=\"first\" onclick=\"{0}({1}); return false;\">마지막 페이지</a>&#160;";
   }
}

<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<itemList><c:forEach var="vo" items="${item_list}">
		<item>
			<id>${vo.itemId}</id>
			<type>${vo.itemTypeId}</type>
			<tname>${vo.itemTypeName}</tname>
			<name>${vo.itemName}</name>
			<detail>${vo.itemDetail}</detail>
			<price>${vo.itemPrice}</price>
			<path>${vo.itemImgPath}</path>
		</item></c:forEach>
</itemList>
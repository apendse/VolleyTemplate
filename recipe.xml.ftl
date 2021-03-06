<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />
    <dependency mavenUrl="com.android.support:recyclerview-v7:${buildApi}.+" />
    <dependency mavenUrl="com.android.volley:volley:1.0.0"/>
    <dependency mavenUrl="com.jakewharton:butterknife:1.0.0"/>
    <dependency mavenUrl="com.google.code.gson:gson:2.8.2"/>
    <instantiate from="root/res/layout/fragment_list.xml"
                 to="${escapeXmlAttribute(resOut)}/layout/${fragment_layout_list}.xml" />
    <instantiate from="root/res/layout/item_list_content.xml"
                 to="${escapeXmlAttribute(resOut)}/layout/${fragment_layout}.xml" />
    <instantiate from="root/src/app_package/ListFragment.java.ftl"
                 to="${escapeXmlAttribute(srcOut)}/${className}.java" />
    <instantiate from="root/src/app_package/RecyclerViewAdapter.java.ftl"
                 to="${escapeXmlAttribute(srcOut)}/${adapterClassName}.java" />

   
    <instantiate from="root/src/app_package/NetworkManager.java.ftl" 
                 to="${escapeXmlAttribute(srcOut)}/NetworkManager.java"/>

    <merge from="root/AndroidManifest.xml.ftl"
           to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <#include "recipe_dummy_content.xml.ftl" />

    <instantiate from="root/src/app_package/ObjectClass.java.ftl" 
                 to="${escapeXmlAttribute(srcOut)}/${objectClass}.java"/>

    <merge from="root/res/values/dimens.xml"
             to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />
    <open file="${escapeXmlAttribute(srcOut)}/${className}.java" />         
</recipe>

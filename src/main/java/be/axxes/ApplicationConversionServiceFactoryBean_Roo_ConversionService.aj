// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package be.axxes;

import be.axxes.ApplicationConversionServiceFactoryBean;
import be.axxes.BlogPost;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<BlogPost, String> ApplicationConversionServiceFactoryBean.getBlogPostToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<be.axxes.BlogPost, java.lang.String>() {
            public String convert(BlogPost blogPost) {
                return new StringBuilder().append(blogPost.getCreated()).append(' ').append(blogPost.getAuthor()).append(' ').append(blogPost.getContents()).toString();
            }
        };
    }
    
    public Converter<Long, BlogPost> ApplicationConversionServiceFactoryBean.getIdToBlogPostConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, be.axxes.BlogPost>() {
            public be.axxes.BlogPost convert(java.lang.Long id) {
                return BlogPost.findBlogPost(id);
            }
        };
    }
    
    public Converter<String, BlogPost> ApplicationConversionServiceFactoryBean.getStringToBlogPostConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, be.axxes.BlogPost>() {
            public be.axxes.BlogPost convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), BlogPost.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getBlogPostToStringConverter());
        registry.addConverter(getIdToBlogPostConverter());
        registry.addConverter(getStringToBlogPostConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}

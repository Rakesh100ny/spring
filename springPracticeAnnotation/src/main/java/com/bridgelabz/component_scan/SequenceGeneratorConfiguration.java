package com.bridgelabz.component_scan;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.bridgelabz.component_scan.SequenceGenerator;
@Configuration
public class SequenceGeneratorConfiguration 
{
	@Bean
	public SequenceGenerator sequenceGenerator() {
	    SequenceGenerator sequenceGenerator=new SequenceGenerator();
		sequenceGenerator.setPrefix("30");
		sequenceGenerator.setSuffix("A");
		sequenceGenerator.setInitial(100000);
		return sequenceGenerator;
		}
}
	 


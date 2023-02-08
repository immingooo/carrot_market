package com.carrotMarket;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

//@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
@EnableScheduling // 스케줄링
@SpringBootApplication
public class CarrotMarketApplication {

	public static void main(String[] args) {
		SpringApplication.run(CarrotMarketApplication.class, args);
	}

}

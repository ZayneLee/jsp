package hello.hello_spring;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import hello.hello_spring.repository.JdbcMemberRepository;
import hello.hello_spring.repository.JdbcTemplateMemberRepository;
import hello.hello_spring.repository.JpaMemberRepository;
import hello.hello_spring.repository.MemberRepository;
import hello.hello_spring.repository.MemoryMemberRepository;
import hello.hello_spring.service.MemberService;
import jakarta.persistence.EntityManager;

@Configuration
public class SpringConfig {
	
//	private final DataSource dataSource;
//	private final EntityManager em;
//	
//	public SpringConfig(DataSource dataSource, EntityManager em) {
//		this.dataSource = dataSource;
//		this.em = em;
//	}
	
	private final MemberRepository memberRepository;

	public SpringConfig(MemberRepository memberRepository) {
		super();
		this.memberRepository = memberRepository;
	}

	@Bean
	public MemberService memberService() {
		return new MemberService(memberRepository);
	}
	
//	@Bean
//	public MemberRepository memberRepository() {
//		return new MemoryMemberRepository();
//		return new JdbcMemberRepository(dataSource);
//		return new JdbcTemplateMemberRepository(dataSource);
//		return new JpaMemberRepository(em);
//	}

}

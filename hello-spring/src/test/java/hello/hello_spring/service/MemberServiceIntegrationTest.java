package hello.hello_spring.service;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import hello.hello_spring.domain.Member;
import hello.hello_spring.repository.MemberRepository;

@SpringBootTest
@Transactional
public class MemberServiceIntegrationTest {
	
	@Autowired MemberService memberService;
	@Autowired MemberRepository memory;
	
	@Test
	public void 회원가입() {
		// given
		Member member1 = new Member();
		member1.setName("spring");
		
		// when
		Long resultId = memberService.join(member1);
		
		// then
		Member result = memory.findById(resultId).get();
		Assertions.assertThat(member1.getName()).isEqualTo(result.getName());
	}
	
	@Test
	public void 중복_회원_가입() {
		// given
		Member member1 = new Member();
		member1.setName("123");
		
		Member member2 = new Member();
		member2.setName("spring");
		
		memberService.join(member1);
		
		// when
		try {
			memberService.join(member2);
		} catch (IllegalStateException e) {
			Assertions.assertThat(e.getMessage()).isEqualTo("이미 존재하는 회원입니다.");
		}
		
		
		// then
	}

}

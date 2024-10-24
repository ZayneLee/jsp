package hello.hello_spring.service;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import hello.hello_spring.domain.Member;
import hello.hello_spring.repository.MemoryMemberRepository;

public class MemberServiceTest {
	
	MemberService memberService;
	MemoryMemberRepository memory;
	
	@BeforeEach
	void beforeEach() {
		memory = new MemoryMemberRepository();
		memberService = new MemberService(memory);
	}
	
	@AfterEach
	void afterEach() {
		memory.clearStore();
	}
	
	@Test
	public void 회원가입() {
		// given
		Member member1 = new Member();
		member1.setName("spring");
		
		// when
		Long resultId = memberService.join(member1);
		
		// then
		Member result = memberService.findOne(resultId).get();
		Assertions.assertThat(member1.getName()).isEqualTo(result.getName());
	}
	
	@Test
	public void 중복_회원_가입() {
		// given
		Member member1 = new Member();
		member1.setName("spring");
		
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

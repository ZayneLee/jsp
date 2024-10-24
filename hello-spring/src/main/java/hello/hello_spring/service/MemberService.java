package hello.hello_spring.service;

import java.util.List;
import java.util.Optional;

import hello.hello_spring.domain.Member;
import hello.hello_spring.repository.MemberRepository;
import hello.hello_spring.repository.MemoryMemberRepository;

public class MemberService {

	private MemberRepository memberRepository = new MemoryMemberRepository();

	public Long join(Member member) {

		// 중복 이름 회원 가입 X
		validateDuplicateMember(member);

		memberRepository.save(member);
		return member.getId();
	}

	private void validateDuplicateMember(Member member) {
		memberRepository.findByName(member.getName()).ifPresent(m -> {
			throw new IllegalStateException("이미 존재하는 회원입니다.");
		});
	}
	
	public List<Member> findMembers() {
		return memberRepository.findAll();
	}
	
	public Optional<Member> findOne(Long memberId) {
		return memberRepository.findById(memberId);
	}
}

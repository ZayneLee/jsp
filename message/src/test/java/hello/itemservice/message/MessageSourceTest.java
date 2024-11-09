package hello.itemservice.message;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;

import static org.assertj.core.api.Assertions.*;

import java.util.Locale;

@SpringBootTest
public class MessageSourceTest {

	@Autowired
	MessageSource ms;

	@Test
	void helloMessage() {
		assertThat(ms.getMessage("hello", null, null)).isEqualTo("안녕");
	}

	@Test
	void notFoundMessageCode() {
		assertThatThrownBy(() -> ms.getMessage("no_code", null, null))
		.isInstanceOf(NoSuchMessageException.class);
	}
	
	@Test
	void notFoundMessageCodeDefaultMessage() {
		assertThat(ms.getMessage("no_code", null, "기본 메시지", null)).isEqualTo("기본 메시지");
	}

	@Test
	void argumentMessage() {
		assertThat(ms.getMessage("hello.name", new Object[]{"Spring"}, null)).isEqualTo("안녕 Spring");
	}
	
	@Test
	void enLang() {
		assertThat(ms.getMessage("hello", null, Locale.ENGLISH)).isEqualTo("hello");
	}
}

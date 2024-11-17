package hello.itemservice.web.validation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import hello.itemservice.domain.item.Item;
import hello.itemservice.domain.item.ItemRepository;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/validation/v2/items")
@RequiredArgsConstructor
public class ValidationItemControllerV2 {

	private final ItemRepository itemRepository;

	@Autowired
	public ValidationItemControllerV2(ItemRepository itemRepository) {
		this.itemRepository = itemRepository;
	}

	@GetMapping
	public String items(Model model) {
		List<Item> items = itemRepository.findAll();
		model.addAttribute("items", items);
		return "validation/v2/items";
	}

	@GetMapping("/{itemId}")
	public String item(@PathVariable("itemId") long itemId, Model model) {
		Item item = itemRepository.findById(itemId);
		model.addAttribute("item", item);
		return "validation/v2/item";
	}

	@GetMapping("/add")
	public String addForm(Model model) {
		model.addAttribute("item", new Item());
		return "validation/v2/addForm";
	}

//	@PostMapping("/add")
	public String addItemV1(@ModelAttribute Item item, BindingResult bindingResult,
			RedirectAttributes redirectAttributes, Model model) {

		if (!StringUtils.hasText(item.getItemName())) {
			bindingResult.addError(new FieldError("itme", "itemName", "ItemName Required"));
		}

		if (item.getPrice() == null || item.getPrice() < 1000 || item.getPrice() > 1000000) {
			bindingResult.addError(new FieldError("itme", "price", "price should be from 1000 to 1000000"));
		}

		if (item.getQuantity() == null || item.getQuantity() > 9999) {
			bindingResult.addError(new FieldError("itme", "quantity", "Quantity should be upto 9999"));
		}

		if (item.getPrice() != null && item.getQuantity() != null) {
			int resultPrice = item.getPrice() * item.getQuantity();
			if (resultPrice < 10000) {
				bindingResult.addError(new ObjectError("item",
						"price * quantity should be more than 10,000. current price is " + resultPrice));
			}
		}

		if (bindingResult.hasErrors()) {
			return "validation/v2/addForm";
		}

		Item savedItem = itemRepository.save(item);
		redirectAttributes.addAttribute("itemId", savedItem.getId());
		redirectAttributes.addAttribute("status", true);
		return "redirect:/validation/v2/items/{itemId}";
	}

//	@PostMapping("/add")
	public String addItemV2(@ModelAttribute Item item, BindingResult bindingResult,
			RedirectAttributes redirectAttributes, Model model) {

		if (!StringUtils.hasText(item.getItemName())) {
			bindingResult.addError(
					new FieldError("itme", "itemName", item.getItemName(), false, null, null, "ItemName Required"));
		}

		if (item.getPrice() == null || item.getPrice() < 1000 || item.getPrice() > 1000000) {
			bindingResult.addError(new FieldError("itme", "price", item.getPrice(), false, null, null,
					"price should be from 1000 to 1000000"));
		}

		if (item.getQuantity() == null || item.getQuantity() > 9999) {
			bindingResult.addError(new FieldError("itme", "quantity", item.getQuantity(), false, null, null,
					"Quantity should be upto 9999"));
		}

		if (item.getPrice() != null && item.getQuantity() != null) {
			int resultPrice = item.getPrice() * item.getQuantity();
			if (resultPrice < 10000) {
				bindingResult.addError(new ObjectError("item",
						"price * quantity should be more than 10,000. current price is " + resultPrice));
			}
		}

		if (bindingResult.hasErrors()) {
			return "validation/v2/addForm";
		}

		Item savedItem = itemRepository.save(item);
		redirectAttributes.addAttribute("itemId", savedItem.getId());
		redirectAttributes.addAttribute("status", true);
		return "redirect:/validation/v2/items/{itemId}";
	}

	@PostMapping("/add")
	public String addItemV3(@ModelAttribute Item item, BindingResult bindingResult,
			RedirectAttributes redirectAttributes, Model model) {

		if (!StringUtils.hasText(item.getItemName())) {
			bindingResult.addError(new FieldError("itme", "itemName", item.getItemName(), false,
					new String[] { "required.item.itemName" }, null, null));
		}

		if (item.getPrice() == null || item.getPrice() < 1000 || item.getPrice() > 1000000) {
			bindingResult.addError(new FieldError("itme", "price", item.getPrice(), false,
					new String[] { "range.item.price" }, new Object[] { 1000, 1000000 }, null));
		}

		if (item.getQuantity() == null || item.getQuantity() > 9999) {
			bindingResult.addError(new FieldError("itme", "quantity", item.getQuantity(), false,
					new String[] { "max.item.quantity" }, new Object[] { 9999 }, null));
		}

		if (item.getPrice() != null && item.getQuantity() != null) {
			int resultPrice = item.getPrice() * item.getQuantity();
			if (resultPrice < 10000) {
				bindingResult.addError(new ObjectError("item", new String[] { "totalPriceMin" },
						new Object[] { 10000, resultPrice }, null));
			}
		}

		if (bindingResult.hasErrors()) {
			return "validation/v2/addForm";
		}

		Item savedItem = itemRepository.save(item);
		redirectAttributes.addAttribute("itemId", savedItem.getId());
		redirectAttributes.addAttribute("status", true);
		return "redirect:/validation/v2/items/{itemId}";
	}

	@GetMapping("/{itemId}/edit")
	public String editForm(@PathVariable("itemId") Long itemId, Model model) {
		Item item = itemRepository.findById(itemId);
		model.addAttribute("item", item);
		return "validation/v2/editForm";
	}

	@PostMapping("/{itemId}/edit")
	public String edit(@PathVariable("itemId") Long itemId, @ModelAttribute Item item) {
		itemRepository.update(itemId, item);
		return "redirect:/validation/v2/items/{itemId}";
	}

}

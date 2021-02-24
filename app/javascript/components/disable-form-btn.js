const initBtnDisable = () => {
  const checkboxes = document.querySelectorAll('#message_privacy_policy')
  checkboxes.forEach((checkbox) => {
    checkbox.addEventListener('change', (event) => {
      console.log(event.currentTarget.checked)
      const sendButton = document.querySelector('input[type="submit"][name="mensagem contato"]')
      console.log(sendButton)
      if (event.currentTarget.checked) {
        sendButton.disabled = false;
      } else {
        sendButton.disabled = true;
      }
    })
  })
    
}

export { initBtnDisable };
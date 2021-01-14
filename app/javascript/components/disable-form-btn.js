const initBtnDisable = () => {
  const checkbox = document.querySelector('#message_privacy_policy')
  checkbox.addEventListener('change', (event) => {
    const sendButton = document.querySelector('input[type="submit"][name="mensagem contato"]')
    if (event.currentTarget.checked) {
      sendButton.disabled = false;
    } else {
      sendButton.disabled = true;
    }
  })
}

export { initBtnDisable };
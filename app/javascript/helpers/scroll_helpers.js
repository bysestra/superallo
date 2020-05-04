const smoothSupported = "scrollBehavior" in document.documentElement.style

export async function scrollToElement(element, { behavior = "smooth", block = "start", inline = "nearest" } = {}) {
  if (behavior == "smooth" && !smoothSupported) await polyfillSmooth()
  element.scrollIntoView({ behavior, block, inline })
}

let smoothPolyfilled
async function polyfillSmooth() {
  const { polyfill } = await import(/* webpackChunkName: "smoothscroll-polyfill" */ "smoothscroll-polyfill")
  if (smoothPolyfilled) return
  smoothPolyfilled = true
  polyfill()
}

import { useState, useEffect } from "react";
import "@/css/ScrollTop/ScrollTop.css";

export default function ScrollTop() {
  const [show, setShow] = useState(false);

  // show the button after scrolling down a bit
  useEffect(() => {
    const onScroll = () => setShow(window.scrollY > 100);
    window.addEventListener("scroll", onScroll);
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  // smooth scroll back to the top
  const goTop = () => window.scrollTo({ top: 0, behavior: "smooth" });

  return (
    <button className={show ? "scroll-top show" : "scroll-top"} onClick={goTop}>
      <i className="bi bi-arrow-up"></i>
    </button>
  );
}
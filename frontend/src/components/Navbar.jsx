import { useState, useEffect } from "react";
import { getData } from "@/api/api";
import "@/css/Navbar/Navbar.css";

// sections ids on the page
const links = ["home", "about", "services", "projects"];

export default function Navbar() {
  const [settings, setSettings] = useState({});    // data from database
  const [active, setActive] = useState("home");    // current section
  const [menuOpen, setMenuOpen] = useState(false); // mobile menu

  // load site name, phone and button text
  useEffect(() => {
    getData("settings.php").then(setSettings);
  }, []);

  // change the active link while scrolling
  useEffect(() => {
    const onScroll = () => {
      links.forEach((id) => {
        const section = document.getElementById(id);
        if (section && window.scrollY >= section.offsetTop - 100) setActive(id);
      });
    };

    window.addEventListener("scroll", onScroll);
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  return (
    <header className="navbar">
      {/* logo */}
      <a href="#home" className="logo">
        <span className="logo-icon"><i className="bi bi-buildings"></i></span>
        {settings.site_name}
      </a>

      {/* menu */}
      <nav className={`nav-links ${menuOpen ? "open" : ""}`}>
        {links.map((id) => (
          <a
            key={id}
            href={`#${id}`}
            className={active === id ? "active" : ""}
            onClick={() => setMenuOpen(false)}
          >
            {id}
          </a>
        ))}

        {/* design only */}
        <span>Team</span>
        <span>Pages <i className="bi bi-chevron-down"></i></span>
        <span>Contact</span>
      </nav>

      {/* phone + button */}
      <div className="nav-right">
        <span className="nav-phone">
          <i className="bi bi-telephone"></i> {settings.phone}
        </span>

        {settings.nav_button_text && <span className="nav-btn">{settings.nav_button_text}</span>}

        <button className="menu-toggle" onClick={() => setMenuOpen(!menuOpen)}>
          <i className={menuOpen ? "bi bi-x" : "bi bi-list"}></i>
        </button>
      </div>
    </header>
  );
}
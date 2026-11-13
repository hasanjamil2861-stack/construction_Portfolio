import { useState, useEffect, useRef } from "react";
import { getData, UPLOADS_URL } from "@/api/api";
import "@/css/Projects/Projects.css";

// must match .project-card height and gap in Projects.css
const CARD_HEIGHT = 280;
const GAP = 22;

// columns depending on screen width
function getColumns() {
  if (window.innerWidth <= 576) return 1;
  if (window.innerWidth <= 992) return 2;
  return 3;
}

export default function Projects() {
  const [data, setData] = useState(null);             // { section, categories, projects }
  const [filter, setFilter] = useState("all");        // selected category slug
  const [columns, setColumns] = useState(getColumns());
  const [current, setCurrent] = useState(null);       // open image index (null = closed)
  const [closing, setClosing] = useState(false);      // lightbox close animation
  const lastPositions = useRef({});                   // where each card was last time

  // load projects from the database
  useEffect(() => {
    getData("projects.php").then(setData);
  }, []);

  // update columns when the window is resized
  useEffect(() => {
    const onResize = () => setColumns(getColumns());
    window.addEventListener("resize", onResize);
    return () => window.removeEventListener("resize", onResize);
  }, []);

  // projects of the selected category
  const projects = data ? data.projects : [];
  const filtered =
    filter === "all" ? projects : projects.filter((p) => p.category_slug === filter);

  // lightbox controls
  const showPrev = () => setCurrent((i) => (i - 1 + filtered.length) % filtered.length);
  const showNext = () => setCurrent((i) => (i + 1) % filtered.length);

  const closeLightbox = () => {
    setClosing(true);
    setTimeout(() => {
      setCurrent(null);
      setClosing(false);
    }, 300); // same as the fade out time in css
  };

  // while lightbox is open: stop page scroll + keyboard arrows / esc
  useEffect(() => {
    if (current === null) return;

    document.body.style.overflow = "hidden";

    const onKey = (e) => {
      if (e.key === "Escape") closeLightbox();
      if (e.key === "ArrowLeft") showPrev();
      if (e.key === "ArrowRight") showNext();
    };
    window.addEventListener("keydown", onKey);

    return () => {
      document.body.style.overflow = "";
      window.removeEventListener("keydown", onKey);
    };
  }, [current]);

  // wait until data is loaded
  if (!data) return null;

  const { section, categories } = data;

  // position of every card in the grid
  // visible cards get a new place, hidden cards stay where they were and shrink
  const positions = {};
  let index = 0;

  projects.forEach((project) => {
    const visible = filter === "all" || project.category_slug === filter;

    if (visible) {
      positions[project.id] = {
        visible: true,
        index: index, // used to open the lightbox
        col: index % columns,
        row: Math.floor(index / columns),
      };
      index++;
    } else {
      const last = lastPositions.current[project.id] || { col: 0, row: 0 };
      positions[project.id] = { ...last, visible: false };
    }
  });

  lastPositions.current = positions;

  // grid height depends on how many rows are visible
  const rows = Math.ceil(filtered.length / columns);
  const gridHeight = rows > 0 ? rows * (CARD_HEIGHT + GAP) - GAP : 0;

  return (
    <section id="projects" className="projects">
      <div className="container">
        <div className="section-title">
          <h2>{section.title}</h2>
          <p>{section.subtitle}</p>
        </div>

        {/* filter buttons */}
        <div className="projects-filter">
          <button
            className={filter === "all" ? "active" : ""}
            onClick={() => setFilter("all")}
          >
            All Projects
          </button>

          {categories.map((category) => (
            <button
              key={category.id}
              className={filter === category.slug ? "active" : ""}
              onClick={() => setFilter(category.slug)}
            >
              {category.name}
            </button>
          ))}
        </div>

        {/* projects grid */}
        <div className="projects-grid" style={{ "--cols": columns, height: gridHeight }}>
          {projects.map((project) => {
            const pos = positions[project.id];

            return (
              <div
                key={project.id}
                className={pos.visible ? "project-card" : "project-card hidden"}
                style={{ "--col": pos.col, "--row": pos.row }}
              >
                <img src={`${UPLOADS_URL}/${project.image}`} alt={project.title} />

                <div className="project-info">
                  <span className="project-category">{project.category_name}</span>
                  <h3>{project.title}</h3>
                  <p>{project.description}</p>
                </div>

                {/* hover buttons */}
                <div className="project-actions">
                  <button onClick={() => setCurrent(pos.index)}>
                    <i className="bi bi-arrows-angle-expand"></i>
                  </button>
                  <span>
                    <i className="bi bi-arrow-right"></i>
                  </span>
                </div>
              </div>
            );
          })}
        </div>
      </div>

      {/* fullscreen lightbox (clicking the dark background closes it) */}
      {current !== null && (
        <div className={closing ? "lightbox closing" : "lightbox"} onClick={closeLightbox}>
          {/* close: the click reaches the background and closes */}
          <button className="lightbox-btn lightbox-close">
            <i className="bi bi-x-lg"></i>
          </button>

          <button
            className="lightbox-btn lightbox-prev"
            onClick={(e) => { e.stopPropagation(); showPrev(); }}
          >
            <i className="bi bi-chevron-left"></i>
          </button>

          {/* key = current, so the zoom animation plays on every image */}
          <div className="lightbox-slide" key={current} onClick={(e) => e.stopPropagation()}>
            <img src={`${UPLOADS_URL}/${filtered[current].image}`} alt={filtered[current].title} />
            <div className="lightbox-caption">{filtered[current].title}</div>
          </div>

          <button
            className="lightbox-btn lightbox-next"
            onClick={(e) => { e.stopPropagation(); showNext(); }}
          >
            <i className="bi bi-chevron-right"></i>
          </button>
        </div>
      )}
    </section>
  );
}
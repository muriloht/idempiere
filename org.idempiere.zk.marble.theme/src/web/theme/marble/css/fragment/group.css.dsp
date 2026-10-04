<%--
  Marble adherence: let Marble style .z-group / .z-listgroup natively (surface-container
  background, outline-variant borders, hover, typography). We only supply the collapse/
  expand GLYPH, matching Marble's OWN toggle convention (see .z-tree-icon): a single
  chevron that rotates 90deg when open — via Lucide mask (the removed FontAwesome font is
  gone). Previously this re-styled z-group with iceblue colors + FA icons, broken on Marble.
--%>
.z-group-icon::before,
.z-icon-listgroup-close::before,
.z-icon-listgroup-open::before {
	content: "";
	display: inline-block;
	width: 1em;
	height: 1em;
	background-color: currentColor;
	-webkit-mask: var(--_chevron) no-repeat 50% / contain;
	mask: var(--_chevron) no-repeat 50% / contain;
	transition: transform var(--zk-motion-duration-standard, .2s) var(--zk-motion-easing-standard, ease);
}
.z-group-icon,
.z-icon-listgroup-close,
.z-icon-listgroup-open {
	--_chevron: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='m9 18 6-6-6-6'/%3E%3C/svg%3E");
}
.z-group-icon-open::before,
.z-icon-listgroup-open::before {
	transform: rotate(90deg);
}

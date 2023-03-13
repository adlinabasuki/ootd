// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { previewImageOnFileSelect } from "./components/photo_preview"

previewImageOnFileSelect();

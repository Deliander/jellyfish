echo "[macOS] Building"
VERSION=$(node ./getVersion.js)
mkdir -p builds
electron-packager . Jellyfish --exclude=docs --app-version "$VERSION" --protocol=jellyfish-lsef --platform darwin --out ./builds --overwrite --icon ../jellyfish-ui/assets/icon.icns --asar --app-bundle-id com.thelmgn.jellyfish --darwin-dark-mode-support
cd builds/Jellyfish-darwin-x64
mv Jellyfish.app "Jellyfish-$VERSION.app"
cd ..
zip -r9 "Jellyfish-$VERSION.zip" "Jellyfish-$VERSION.app"
mv "Jellyfish-$VERSION.zip" ../
cd ..
rm -rf "builds"

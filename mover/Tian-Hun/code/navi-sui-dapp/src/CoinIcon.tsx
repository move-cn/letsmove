import { useEffect, useState } from "react";

type CoinIconProps = {
    src: string;
    alt: string;
    size?: number;
    extensions?: string[];
};

export const CoinIcon: React.FC<CoinIconProps> = ({ src, alt, size = 32, extensions = ['svg', 'png'] }) => {
    const [currentSrc, setCurrentSrc] = useState(`https://app.naviprotocol.io/imgs/token/sui.svg`);

    useEffect(() => {
        const tryLoadImage = async (ext: string) => {
            const img = new Image();
            img.src = `${src}.${ext}`;
            return new Promise((resolve) => {
                img.onload = () => resolve(true);
                img.onerror = () => resolve(false);
            });
        };
        
        const loadNextExtension = async () => {
            if (extensions.length === 0) return;
            const ext = extensions.shift();
            const loaded = await tryLoadImage(ext!);

            if (loaded) {
                setCurrentSrc(`${src}.${ext}`);
            } else {
                loadNextExtension();
            }
        };

        loadNextExtension();
    }, [src, extensions]);

    return <img src={currentSrc} alt={alt} width={size} height={size} />;
};
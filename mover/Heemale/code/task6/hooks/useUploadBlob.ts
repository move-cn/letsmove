import { useState } from 'react';

export interface UploadedBlobInfo {
    blobId: string;
    endEpoch: number;
    suiRef: string;
    status: string;
}

export interface UploadBlobConfig {
    initialEpochs?: string;
    initialPublisherUrl?: string;
    initialAggregatorUrl?: string;
    proxyUrl?: string;
}

const DEFAULT_CONFIG: Required<UploadBlobConfig> = {
    initialEpochs: process.env.NEXT_PUBLIC_INITIAL_EPOCHS || '1',
    initialPublisherUrl: process.env.NEXT_PUBLIC_PUBLISHER_URL || 'https://publisher-devnet.walrus.space',
    initialAggregatorUrl: process.env.NEXT_PUBLIC_AGGREGATOR_URL || 'https://aggregator-devnet.walrus.space',
    proxyUrl: process.env.NEXT_PUBLIC_PROXY_URL || ''
};

export function useUploadBlob(config: UploadBlobConfig = {}) {
    const finalConfig = { ...DEFAULT_CONFIG, ...config };

    const [epochs, setEpochs] = useState(finalConfig.initialEpochs);
    const [uploading, setUploading] = useState(false);
    const [uploadedBlobs, setUploadedBlobs] = useState<UploadedBlobInfo[]>([]);
    const [publisherUrl, setPublisherUrl] = useState(finalConfig.initialPublisherUrl);
    const [aggregatorUrl, setAggregatorUrl] = useState(finalConfig.initialAggregatorUrl);

    const storeBlob = async (fileOrUrl: File | string) => {
        setUploading(true);
        try {
            let body: File | Blob;
            if (typeof fileOrUrl === 'string') {
                const response = await fetch(finalConfig.proxyUrl, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ url: fileOrUrl }),
                });
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                body = await response.blob();
            } else {
                body = fileOrUrl;
            }

            const response = await fetch(`${publisherUrl}/v1/store?epochs=${epochs}`, {
                method: 'PUT',
                body: body,
            });

            if (!response.ok) {
                throw new Error('Something went wrong when storing the blob!');
            }

            const info = await response.json();
            let blobInfo: UploadedBlobInfo;

            if ('alreadyCertified' in info) {
                blobInfo = {
                    status: 'Already certified',
                    blobId: info.alreadyCertified.blobId,
                    endEpoch: info.alreadyCertified.endEpoch,
                    suiRef: info.alreadyCertified.event.txDigest,
                };
            } else if ('newlyCreated' in info) {
                blobInfo = {
                    status: 'Newly created',
                    blobId: info.newlyCreated.blobObject.blobId,
                    endEpoch: info.newlyCreated.blobObject.storage.endEpoch,
                    suiRef: info.newlyCreated.blobObject.id,
                };
            } else {
                throw new Error('Unexpected response format');
            }

            setUploadedBlobs(prev => [blobInfo, ...prev]);
            return blobInfo;
        } catch (error) {
            console.error('Error in storeBlob:', error);
            throw error;
        } finally {
            setUploading(false);
        }
    };

    return {
        epochs,
        setEpochs,
        uploading,
        uploadedBlobs,
        publisherUrl,
        setPublisherUrl,
        aggregatorUrl,
        setAggregatorUrl,
        storeBlob
    };
} 
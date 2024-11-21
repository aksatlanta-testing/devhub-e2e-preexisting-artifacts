
{{- define "go-echo1a91afc9-b516-4ae7-bf8f-ec489a2e4bff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a91afc9-b516-4ae7-bf8f-ec489a2e4bff.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo1a91afc9-b516-4ae7-bf8f-ec489a2e4bff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a91afc9-b516-4ae7-bf8f-ec489a2e4bff.labels" -}}
helm.sh/chart: {{ include "go-echo1a91afc9-b516-4ae7-bf8f-ec489a2e4bff.chart" . }}
{{ include "go-echo1a91afc9-b516-4ae7-bf8f-ec489a2e4bff.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1a91afc9-b516-4ae7-bf8f-ec489a2e4bff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1a91afc9-b516-4ae7-bf8f-ec489a2e4bff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
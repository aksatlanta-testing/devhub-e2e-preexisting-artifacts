
{{- define "go-echoab35a17d-e4c9-42c0-a3cb-e62dacaf0e6d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab35a17d-e4c9-42c0-a3cb-e62dacaf0e6d.fullname" -}}
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


{{- define "go-echoab35a17d-e4c9-42c0-a3cb-e62dacaf0e6d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab35a17d-e4c9-42c0-a3cb-e62dacaf0e6d.labels" -}}
helm.sh/chart: {{ include "go-echoab35a17d-e4c9-42c0-a3cb-e62dacaf0e6d.chart" . }}
{{ include "go-echoab35a17d-e4c9-42c0-a3cb-e62dacaf0e6d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoab35a17d-e4c9-42c0-a3cb-e62dacaf0e6d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoab35a17d-e4c9-42c0-a3cb-e62dacaf0e6d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
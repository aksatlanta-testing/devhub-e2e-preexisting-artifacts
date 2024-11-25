
{{- define "go-echo4c50136c-02ad-4b5c-a60b-0c3904c8b651.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4c50136c-02ad-4b5c-a60b-0c3904c8b651.fullname" -}}
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


{{- define "go-echo4c50136c-02ad-4b5c-a60b-0c3904c8b651.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4c50136c-02ad-4b5c-a60b-0c3904c8b651.labels" -}}
helm.sh/chart: {{ include "go-echo4c50136c-02ad-4b5c-a60b-0c3904c8b651.chart" . }}
{{ include "go-echo4c50136c-02ad-4b5c-a60b-0c3904c8b651.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4c50136c-02ad-4b5c-a60b-0c3904c8b651.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4c50136c-02ad-4b5c-a60b-0c3904c8b651.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
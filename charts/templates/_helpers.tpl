
{{- define "go-echo656d692f-e6ac-4b9f-963a-9f68a1a7f358.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo656d692f-e6ac-4b9f-963a-9f68a1a7f358.fullname" -}}
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


{{- define "go-echo656d692f-e6ac-4b9f-963a-9f68a1a7f358.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo656d692f-e6ac-4b9f-963a-9f68a1a7f358.labels" -}}
helm.sh/chart: {{ include "go-echo656d692f-e6ac-4b9f-963a-9f68a1a7f358.chart" . }}
{{ include "go-echo656d692f-e6ac-4b9f-963a-9f68a1a7f358.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo656d692f-e6ac-4b9f-963a-9f68a1a7f358.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo656d692f-e6ac-4b9f-963a-9f68a1a7f358.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
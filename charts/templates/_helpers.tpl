
{{- define "go-echoef8e5d0b-4674-46b5-887a-bd11c9da19ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoef8e5d0b-4674-46b5-887a-bd11c9da19ff.fullname" -}}
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


{{- define "go-echoef8e5d0b-4674-46b5-887a-bd11c9da19ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoef8e5d0b-4674-46b5-887a-bd11c9da19ff.labels" -}}
helm.sh/chart: {{ include "go-echoef8e5d0b-4674-46b5-887a-bd11c9da19ff.chart" . }}
{{ include "go-echoef8e5d0b-4674-46b5-887a-bd11c9da19ff.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoef8e5d0b-4674-46b5-887a-bd11c9da19ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoef8e5d0b-4674-46b5-887a-bd11c9da19ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
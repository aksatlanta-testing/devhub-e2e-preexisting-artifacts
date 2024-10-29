
{{- define "go-echof4b1f2d9-f27e-4ebe-9672-d1bd11d8ac3a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof4b1f2d9-f27e-4ebe-9672-d1bd11d8ac3a.fullname" -}}
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


{{- define "go-echof4b1f2d9-f27e-4ebe-9672-d1bd11d8ac3a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof4b1f2d9-f27e-4ebe-9672-d1bd11d8ac3a.labels" -}}
helm.sh/chart: {{ include "go-echof4b1f2d9-f27e-4ebe-9672-d1bd11d8ac3a.chart" . }}
{{ include "go-echof4b1f2d9-f27e-4ebe-9672-d1bd11d8ac3a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof4b1f2d9-f27e-4ebe-9672-d1bd11d8ac3a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof4b1f2d9-f27e-4ebe-9672-d1bd11d8ac3a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
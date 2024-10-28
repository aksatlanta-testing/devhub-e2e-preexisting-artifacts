
{{- define "go-echo6e007df2-deaa-4b1b-b711-633e0aa802df.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6e007df2-deaa-4b1b-b711-633e0aa802df.fullname" -}}
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


{{- define "go-echo6e007df2-deaa-4b1b-b711-633e0aa802df.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6e007df2-deaa-4b1b-b711-633e0aa802df.labels" -}}
helm.sh/chart: {{ include "go-echo6e007df2-deaa-4b1b-b711-633e0aa802df.chart" . }}
{{ include "go-echo6e007df2-deaa-4b1b-b711-633e0aa802df.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6e007df2-deaa-4b1b-b711-633e0aa802df.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6e007df2-deaa-4b1b-b711-633e0aa802df.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echoa740a1d7-ce53-46ce-9f2f-21bfb7887ede.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa740a1d7-ce53-46ce-9f2f-21bfb7887ede.fullname" -}}
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


{{- define "go-echoa740a1d7-ce53-46ce-9f2f-21bfb7887ede.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa740a1d7-ce53-46ce-9f2f-21bfb7887ede.labels" -}}
helm.sh/chart: {{ include "go-echoa740a1d7-ce53-46ce-9f2f-21bfb7887ede.chart" . }}
{{ include "go-echoa740a1d7-ce53-46ce-9f2f-21bfb7887ede.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa740a1d7-ce53-46ce-9f2f-21bfb7887ede.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa740a1d7-ce53-46ce-9f2f-21bfb7887ede.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
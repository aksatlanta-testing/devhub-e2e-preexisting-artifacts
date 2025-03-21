
{{- define "go-echof516b40d-6b31-4f80-940e-aa58e2217dda.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof516b40d-6b31-4f80-940e-aa58e2217dda.fullname" -}}
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


{{- define "go-echof516b40d-6b31-4f80-940e-aa58e2217dda.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof516b40d-6b31-4f80-940e-aa58e2217dda.labels" -}}
helm.sh/chart: {{ include "go-echof516b40d-6b31-4f80-940e-aa58e2217dda.chart" . }}
{{ include "go-echof516b40d-6b31-4f80-940e-aa58e2217dda.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof516b40d-6b31-4f80-940e-aa58e2217dda.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof516b40d-6b31-4f80-940e-aa58e2217dda.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
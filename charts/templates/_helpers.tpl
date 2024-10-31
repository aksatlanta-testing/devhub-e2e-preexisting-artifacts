
{{- define "go-echo15c385b9-f12d-40cb-9e11-f6b35cf44678.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo15c385b9-f12d-40cb-9e11-f6b35cf44678.fullname" -}}
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


{{- define "go-echo15c385b9-f12d-40cb-9e11-f6b35cf44678.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo15c385b9-f12d-40cb-9e11-f6b35cf44678.labels" -}}
helm.sh/chart: {{ include "go-echo15c385b9-f12d-40cb-9e11-f6b35cf44678.chart" . }}
{{ include "go-echo15c385b9-f12d-40cb-9e11-f6b35cf44678.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo15c385b9-f12d-40cb-9e11-f6b35cf44678.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo15c385b9-f12d-40cb-9e11-f6b35cf44678.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
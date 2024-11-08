
{{- define "go-echo6b9debc1-ee43-4a29-bf17-4012503f45f5.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6b9debc1-ee43-4a29-bf17-4012503f45f5.fullname" -}}
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


{{- define "go-echo6b9debc1-ee43-4a29-bf17-4012503f45f5.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6b9debc1-ee43-4a29-bf17-4012503f45f5.labels" -}}
helm.sh/chart: {{ include "go-echo6b9debc1-ee43-4a29-bf17-4012503f45f5.chart" . }}
{{ include "go-echo6b9debc1-ee43-4a29-bf17-4012503f45f5.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6b9debc1-ee43-4a29-bf17-4012503f45f5.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6b9debc1-ee43-4a29-bf17-4012503f45f5.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}